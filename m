Return-Path: <SRS0=Ntwg=IW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37080C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 01:25:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF32C619B2
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 01:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF32C619B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6ZWRcyi76v8/NkBLSM6hPq8np9K8MlDtXVIUmTx8ogY=; b=BYFCNcwX2YlNBxl2AiNLMefnc
	xqjWTwJhwtzaM0zecnUnEv3FRqSY/sxTgCJQshSf0ooCuCNotR4MsiGh4mNXmThbyhDqLGiVuiVUS
	UezxpP9DtEhx7m22r7ZsaGcK50ICbufn6FzLzwwriE+NZ3IT6YQGkhW+uR38DwiwSKLyoi3Uv5tWn
	X9F5bs4i+XASobE6jZ517hwdfmn+5elIw88PSnh36EWdpKHBzLdbjXVnOb1lm86uFYlgC6io0vmNu
	v8yFMuQYxd2USrf49nnxVv6IZNHZfp7mVWnOuAVo2VNspLw3SYBTcofL3+k5Y96W+/RC9UeeSLKe2
	2Dh0OhFtA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOsGg-00G55v-RV; Wed, 24 Mar 2021 01:25:06 +0000
Received: from m12-12.163.com ([220.181.12.12])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOsGV-00G54l-KO; Wed, 24 Mar 2021 01:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=O4/+Y
 l7+L+jA/cvkns/Is7wuSzLFWxwyEvnNlw4szcQ=; b=iYLrgz8UTLylqUtlnSiW4
 ilK50eFueW79myS7GXwCThjbfV3IHviVlquvfENcer/rKyKKPkjm6gZAO3ofb7+G
 3O+6HVirRMv/dw905YhZmKl96fm2O94uytPZlIpfi1JXkYu2kOvry/RtlvHwVoLD
 DJA9g11NmDP6ayiyeNB4LA=
Received: from localhost (unknown [218.94.48.178])
 by smtp8 (Coremail) with SMTP id DMCowABnyxzHlFpg8X_KWA--.58686S2;
 Wed, 24 Mar 2021 09:24:24 +0800 (CST)
Date: Wed, 24 Mar 2021 09:24:35 +0800
From: Jian Dong <dj0227@163.com>
To: Mark Brown <broonie@kernel.org>
Cc: matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 huyue2@yulong.com, Jian Dong <dongjian@yulong.com>
Subject: Re: [PATCH] regulator: mt6360: remove redundant error print
Message-ID: <20210324092435.00000343@163.com>
In-Reply-To: <20210323171628.GA9323@sirena.org.uk>
References: <1616502161-125407-1-git-send-email-dj0227@163.com>
 <20210323171628.GA9323@sirena.org.uk>
Organization: yulong
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
X-CM-TRANSID: DMCowABnyxzHlFpg8X_KWA--.58686S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWkCFyDtF4fJr15Zw15twb_yoWfWFX_CF
 1fCa1IkwsrArsrKFnIqF9IvrZxtw1qqa40q39rKFW3AryfZFn8J3srCryxZr4rX3y0krnx
 uwnYvr4UXr17ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb3C7UUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: dgmqjjqx6rljoofrz/1tbiqAhf3Vc7UBLfsQAAsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_012456_260644_7E8B1516 
X-CRM114-Status: GOOD (  11.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 23 Mar 2021 17:16:28 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Tue, Mar 23, 2021 at 08:22:41PM +0800, Jian Dong wrote:
> > From: Jian Dong <dongjian@yulong.com>
> > 
> > fixes coccicheck warning:
> > 
> > drivers/regulator/mt6360-regulator.c:384:3-10: line 384 is
> > redundant because platform_get_irq() already prints an error  
> 
> This doesn't apply against current code, please check and resend.
> 
> Applying: regulator: mt6360: remove redundant error print
> error: sha1 information is lacking or useless
> (drivers/regulator/mt6360-regulator.c). error: could not build fake
> ancestor Patch failed at 0001 regulator: mt6360: remove redundant
> error print

Hi 

I find the problem, before this patch, I had commit a patch 
"[PATCH]regulator: Use IRQF_ONESHOT", and it hasn't be accepted now, So
the current code is different.

I will modify and resend later.  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
