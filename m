Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2DAC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 11:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2+6JslDaTIPyX+rbH4hQJJ0nKSSzOSrQAiRCaPzAUvY=; b=RQ7TgyqQiWEaJpvwgd+cJgjKD4
	i6aUYzrqRdLrt0lVl10X5zH+d53i4pATTWVp6b+kOO/ePxKb3uJJV/knbSpHUB+RT8AD/1r7podpz
	H/GcyRJ/vQ/MW/aX/z/66t7imJnJdTO3oMbPE80oms+R449rPebe43uSVNoULmF64C6fz9trbCefl
	tKyqno7iJSM23KDV7DGqDG5ZP8MLdYAIgMt0mF/pCWdEnxnWkr/AeDm3RL7nWDo0PMrZIqzbVr1Xi
	7k+jK3J8lDGu+AOnWvMdW4xkjtfr76VwLz0bVZ/qcJX7Fs1MJds5yWEcGPqxIjvcEeSw4KaUtLI/S
	c0f47kKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6sZa-00GuD4-7W; Thu, 30 Jun 2022 11:43:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6sZX-00GuAv-1e; Thu, 30 Jun 2022 11:43:00 +0000
X-UUID: 31635f4867834aa4882817eef76cb774-20220630
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:8a6a556d-357a-4c2f-8cbc-bc9daeb0cbdf,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:fd581063-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 31635f4867834aa4882817eef76cb774-20220630
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jing-ting.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1347116153; Thu, 30 Jun 2022 04:42:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 30 Jun 2022 18:52:11 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 30 Jun 2022 18:52:11 +0800
Message-ID: <1978e209e71905d89651e61abd07285912d412a1.camel@mediatek.com>
Subject: [Bug] race condition at rebind_subsystems()
From: Jing-Ting Wu <jing-ting.wu@mediatek.com>
To: Johannes Weiner <hannes@cmpxchg.org>
CC: Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <cgroups@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Shakeel Butt <shakeelb@google.com>,
	<wsd_upstream@mediatek.com>, <lixiong.liu@mediatek.com>,
	<wenju.xu@mediatek.com>, <jonathan.jmchen@mediatek.com>
Date: Thu, 30 Jun 2022 18:52:10 +0800
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_044259_156638_435303EF 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Johannes



We find the KE(kernel exception) happened when test the reboot test
case in T SW version with kernel-5.15.
The issue is unable to handle kernel paging request at virtual address.

Root cause:
The rebind_subsystems() is no lock held when move css object from A
list to B list,then let B's head be treated as css node at
list_for_each_entry_rcu().
Use the wrong css to get css->ss->css_rstat_flush should get a wrong
address.

The call stack as following:
kthread
-> worker_thread
-> process_one_work
-> flush_memcg_stats_dwork
-> __mem_cgroup_flush_stats
-> cgroup_rstat_flush_irqsafe
-> cgroup_rstat_flush_locked

Detail:
static void cgroup_rstat_flush_locked(struct cgroup *cgrp, bool
may_sleep)
{
...
   rcu_read_lock();
   list_for_each_entry_rcu(css, &pos->rstat_css_list,
                             rstat_css_node)
        css->ss->css_rstat_flush(css, cpu);
   rcu_read_unlock();
...
}

Because the content of css->ss is not a function address,
once the css_rstat_flush is called, kernel exception will happen.
When the issue happened, the list of pos->rstat_css_list at group A is
empty.
There must be racing conditions.

From reviewing code, we find rebind_subsystems() is no lock held when
move css object to other list.

int rebind_subsystems(struct cgroup_root *dst_root, u16 ss_mask)
{
...
   if (ss->css_rstat_flush) {
         list_del_rcu(&css->rstat_css_node);
         list_add_rcu(&css->rstat_css_node,
                      &dcgrp->rstat_css_list);
   }
...
}

If we held a css object from A group list, at same time this css object
was moved to B group list.
Because current pos is in B’s list, link list was link the pos->next to
B’s head, so the pos->member will never equal A’s head, then the B’s
head(cgroup_root->cgroup->rstat_css_list) will be treated as css
node(css->rstat_css_node).
list_for_each_entry_rcu() use the container_of() to get css address,
and it treated the address of [cgroup_root->cgroup->rstat_css_list -
rstat_css_node] to be a css address.
cgroup_rstat_flush_locked() use the wrong css address to do css->ss-
>css_rstat_flush, then the wrong function address will be jump.

#define list_for_each_entry_rcu(pos, head, member,
cond...)             \
   for (__list_check_rcu(dummy, ## cond, 0), \
     pos = list_entry_rcu((head)->next, typeof(*pos), member); \
        &pos->member != (head);                                \
        pos = list_entry_rcu(pos->member.next, typeof(*pos), member))


We look the patch of move css object from A list to B list is merged by
following link:

https://android.googlesource.com/kernel/common/+/a7df69b81aac5bdeb5c5aef9addd680ce22feebf%5E%21/#F0


Do you have any suggestion for this issue?
Thank you.



Best Regards,
Jing-Ting Wu



