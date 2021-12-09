Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36773C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 09:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/2slCLu87SWwQLi7+2+vzDT1fB5SgAwtAXh8FzRGciw=; b=tJGvtUYEdJ4FzE
	lQ+I1+c64Dha8JAWLZ0jXhet+JGHSUskZacWUDeEzREm8ikjpJP4fayVwv+t3OxhIm0ReJ9jTEois
	OvplXBaS/v9sR0Y+5hrRSE+f9RGM8oz6nuGT5BPBB5iLVbIkR+tMzDipOjBRCPTVvIYUNjKW6LtWx
	+vT7ntKBcyBKsjLz8Eu09MHbBjNC79L2gO91QMjyZZPdZB8VMaaD88RPsvhZUyXOPUx4NEAP+49eS
	6UUcBrLz2RQI6zVrrg2ZoAxmHuqSJxl27n+Iqra778Ouh1n4aDIf8HHFFra/C5lNk+fisGXE2ONB9
	HxVvr4knCf/mC59KefPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvFTf-00FLyq-JV; Thu, 09 Dec 2021 09:12:35 +0000
Received: from mxout02.lancloud.ru ([45.84.86.82])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvFRW-00FLBk-42; Thu, 09 Dec 2021 09:10:24 +0000
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 846912243071
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Message-ID: <b77c0732-460f-cf30-c759-d51d37763894@omp.ru>
Date: Thu, 9 Dec 2021 12:10:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 3/3] usb: mtu3: fix list_head check warning
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>, "Yuwen
 Ng" <yuwen.ng@mediatek.com>
References: <20211209031424.17842-1-chunfeng.yun@mediatek.com>
 <20211209031424.17842-3-chunfeng.yun@mediatek.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20211209031424.17842-3-chunfeng.yun@mediatek.com>
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_011022_838648_5160F956 
X-CRM114-Status: UNSURE (   2.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello!

On 09.12.2021 6:14, Chunfeng Yun wrote:

> This is caused by uninitialization of list_head.

    No such word, suggesting to replace with "not initializing". :-)

> BUG: KASAN: use-after-free in __list_del_entry_valid+0x34/0xe4
> 
> Call trace:
> dump_backtrace+0x0/0x298
> show_stack+0x24/0x34
> dump_stack+0x130/0x1a8
> print_address_description+0x88/0x56c
> __kasan_report+0x1b8/0x2a0
> kasan_report+0x14/0x20
> __asan_load8+0x9c/0xa0
> __list_del_entry_valid+0x34/0xe4
> mtu3_req_complete+0x4c/0x300 [mtu3]
> mtu3_gadget_stop+0x168/0x448 [mtu3]
> usb_gadget_unregister_driver+0x204/0x3a0
> unregister_gadget_item+0x44/0xa4
> 
> Reported-by: Yuwen Ng <yuwen.ng@mediatek.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
[...]

MBR, Sergey

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
