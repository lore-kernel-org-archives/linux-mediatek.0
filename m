Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC83C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 09:12:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A59720679
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 09:12:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TjK7/JZV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cVx0KE5h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A59720679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KetIkP75SwFvPuBt66AnL7zyOjf6yl6ho0g3wEgx/ro=; b=TjK7/JZVwZSIX8
	34SuFxqQzzt1GgRFa1+UfCfdZDFAq6QWxTchmyPet++U+F+s/fNiPu7U29/Gs5NwoZZS3nMX5Qu4t
	eshZst2I83/tXGmHx24hJWrXQ07B2V5usC78qf7xuXdjMvGQFALtzzv18ZIiTmKPTh/qgGRAJLdD2
	Z75q7aR1i07OKv64SdL0erGv1ymjVSWE1ClOlP7aBCC0OzNfdyamTES/8sc0Nj3YuWpT89sRMAvY/
	dl4OVWl6zWQwuVAuXza+Evw2wsho8rk8le/YEpEJpgBYyJTF9hQFzeYv90sZRMjGRo0+N5OkeBY1s
	jsE7fWAf4gGOpTyKbw4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl7dP-0001TG-65; Tue, 16 Jun 2020 09:11:59 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl7dM-0001SK-Kb; Tue, 16 Jun 2020 09:11:58 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05G93Vcj108652;
 Tue, 16 Jun 2020 09:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=vHFhOuRLkm8vQDg8Dof4S5HKAiKznh8tBQ+Mr1OID/Q=;
 b=cVx0KE5h1EIzH/Nv6xjfZ5nTWCPzlMev+meeNe8ig/R6zGb1hcI4zPyrerRBxYg+mmc+
 qKwemscmFpcbtZudgCHIJKFWU2+MEqUR3sjHNYzDUDCSWPx5pmD4LBuQpWhngStPV5H0
 4QQ1w6PiSDdHFWQ+ndzL39yxLvqknoA5VRhKUkk0TCj0AiX8q664S4ecxGUJH34dsTgv
 f9QhZLAjaVCh+OyWTAfnAqTx90cKQuDChSnHHM+F7Utt0PRApBfU8iMActdQhiOLrCqP
 +xx+YuMkqnBp9yLLOcyvwHAC7rCtpaJ69Rrf1s2Xt7AKk0laObtgJ3Pt4+o8dQUQESCt bA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 31p6e5wptp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Jun 2020 09:10:36 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05G933ih037660;
 Tue, 16 Jun 2020 09:08:35 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 31p6s6w4s2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jun 2020 09:08:35 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 05G98O1L002227;
 Tue, 16 Jun 2020 09:08:25 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 16 Jun 2020 02:08:24 -0700
Date: Tue, 16 Jun 2020 12:08:07 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v4 1/3] mm/slab: Use memzero_explicit() in kzfree()
Message-ID: <20200616090807.GK4151@kadam>
References: <20200616015718.7812-1-longman@redhat.com>
 <20200616015718.7812-2-longman@redhat.com>
 <20200616064208.GA9499@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616064208.GA9499@dhcp22.suse.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9653
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 mlxscore=0
 suspectscore=0 mlxlogscore=781 phishscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006160066
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9653
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 mlxlogscore=814 lowpriorityscore=0 clxscore=1011
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006160066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_021156_820029_32FAF0E1 
X-CRM114-Status: GOOD (  17.08  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, keyrings@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-stm32@st-md-mailman.stormreply.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-scsi@vger.kernel.org, James Morris <jmorris@namei.org>,
 Matthew Wilcox <willy@infradead.org>, David Rientjes <rientjes@google.com>,
 Waiman Long <longman@redhat.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 wireguard@lists.zx2c4.com, linux-fscrypt@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-nfs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-wireless@vger.kernel.org,
 David Sterba <dsterba@suse.cz>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, target-devel@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, linux-wpan@vger.kernel.org,
 netdev@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 16, 2020 at 08:42:08AM +0200, Michal Hocko wrote:
> On Mon 15-06-20 21:57:16, Waiman Long wrote:
> > The kzfree() function is normally used to clear some sensitive
> > information, like encryption keys, in the buffer before freeing it back
> > to the pool. Memset() is currently used for the buffer clearing. However,
> > it is entirely possible that the compiler may choose to optimize away the
> > memory clearing especially if LTO is being used. To make sure that this
> > optimization will not happen, memzero_explicit(), which is introduced
> > in v3.18, is now used in kzfree() to do the clearing.
> > 
> > Fixes: 3ef0e5ba4673 ("slab: introduce kzfree()")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Waiman Long <longman@redhat.com>
> 
> Acked-by: Michal Hocko <mhocko@suse.com>
> 
> Although I am not really sure this is a stable material. Is there any
> known instance where the memset was optimized out from kzfree?

I told him to add the stable.  Otherwise it will just get reported to
me again.  It's a just safer to backport it before we forget.

regards,
dan carpenter


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
