Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CFFC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 09:40:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93BA96008E
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 09:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93BA96008E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ee
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9yBeIOSljEk/0MU+jieSBRQfGeRS9w7JjqnJmFovJIQ=; b=duSxEju6d7R74J4p/fk9e5fJT
	eWmgFhG9O2JmXxm791uyzyY5HtEYsMyFNW1VBQSW5qteWBLoUqTTMPr0H2bXbSdaMzrc0orIa2Nrk
	USABLgPZqBNnF80U4cj5Qitm1P1Ua9MtLcsiFF8FLJVdbBltfliV0V7g11i1tnbZP4A9AsmFHjvrS
	2oR4BBVcfsplxnYqST1PmGFn6poChViZqsuZ9LDTuJLMPmgLym6D6Ox4icgybaicLEy4uylIpG1Be
	ZuNcT+7dfQry+9dhZhs5ltXAO1EdINEepoMvGLanTCoZKp86XHeThrrA8nB1KY4R+XlvdJHhIzBfq
	ppWxgS25A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgOsE-00GjW9-5T; Tue, 11 May 2021 09:40:18 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgENg-00FpN9-14
 for linux-mediatek@desiato.infradead.org; Mon, 10 May 2021 22:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=qUNtSjAC6oaIe1wuxts7ZrukCeH1tLBMhRTLxL26ZUg=; b=vJfz17dva5f91EzdurstzymwsG
 TSiWjeaOpqskq8i/Zk10LOLqcJAkEabZ8Qdw2BsVquYSk93e3zHdn/cmDpQFwpxF1Q6ghsPyH27M5
 Iv5dtJuGX9DQeTPrADekk8ezJjP+L/qsS/1iySgs+PGykPW/3gX4gI87l+vuDG2ZoMX4IUXOh+mRb
 ZadxxJy36ljuMgSyzjeLoaTw0HNGjbiQCobGLW4l6OFF2nOOdOhEX4fhtlwP2waul74CKZdwD0NN6
 xBDDKrmX0sUryt3R+/IRizexPvaz0bs0pQZF8GQioNsF8HGYsdL7DquT22DmwYiGzfxSPJMV506O8
 wgddwOZA==;
Received: from eu-shark1.inbox.eu ([195.216.236.81])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgENa-0099qz-L8
 for linux-mediatek@lists.infradead.org; Mon, 10 May 2021 22:28:00 +0000
Received: from eu-shark1.inbox.eu (localhost [127.0.0.1])
 by eu-shark1-out.inbox.eu (Postfix) with ESMTP id D2C1C6C00839;
 Tue, 11 May 2021 01:27:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
 t=1620685668; bh=xWFfR+zR2V4HCLUcrbkxEsgUhjNI5D6n3PJhw4hEfsk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=ixCQhipeCWCFICLwfnwwZVj16qJ4QTPs7lLH6Lp2cvrMNixV6gnaycXs4yNfZuq1T
 BuRUPA39yDsFt+V2tGDBXlRJqDLmSnF2fJhbVw84HPkkbE5kJCQvcNQbj4cGczJ+ga
 nyy0rBJPTYzVXS/vpU/+j4jsKf78AzKtstdswgj0=
Received: from localhost (localhost [127.0.0.1])
 by eu-shark1-in.inbox.eu (Postfix) with ESMTP id C29216C00826;
 Tue, 11 May 2021 01:27:48 +0300 (EEST)
Received: from eu-shark1.inbox.eu ([127.0.0.1])
 by localhost (eu-shark1.inbox.eu [127.0.0.1]) (spamfilter, port 35)
 with ESMTP id LrlR4vqsLAT4; Tue, 11 May 2021 01:27:48 +0300 (EEST)
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark1-in.inbox.eu (Postfix) with ESMTP id 7FCB16C0081C;
 Tue, 11 May 2021 01:27:48 +0300 (EEST)
Received: from pc (unknown [134.19.185.67])
 (Authenticated sender: arzamas-16@mail.ee)
 by mail.inbox.eu (Postfix) with ESMTPA id 866C81BE011B;
 Tue, 11 May 2021 01:27:47 +0300 (EEST)
Date: Tue, 11 May 2021 01:27:42 +0300
From: Boris Lysov <arzamas-16@mail.ee>
To: Guenter Roeck <linux@roeck-us.net>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/3] watchdog: mtk_wdt: Refactor code to support more
 SoCs
Message-ID: <20210511012742.569b63f7@pc>
In-Reply-To: <efdce3a5-e5b4-19a8-35f1-8a536220bb3f@roeck-us.net>
References: <20210131234425.9773-1-arzamas-16@mail.ee>
 <20210509211702.549-1-arzamas-16@mail.ee>
 <20210509211702.549-2-arzamas-16@mail.ee>
 <efdce3a5-e5b4-19a8-35f1-8a536220bb3f@roeck-us.net>
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: 885mlYlKBD+tlF+pRmXYAhpV2ydIWeTj+e++1BlagAiJPFD4Yip+XRWr7hJ7DSP4og==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_152758_914072_E1091A33 
X-CRM114-Status: UNSURE (   4.51  )
X-CRM114-Notice: Please train this message.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_152758_914072_E1091A33 
X-CRM114-Status: UNSURE (   1.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,

On Mon, 10 May 2021 06:21:54 -0700
Guenter Roeck <linux@roeck-us.net> wrote:
> > -	struct mtk_wdt_dev *data =
> > +	struct mtk_wdt_dev *wdev =  
> 
> Please do not rename variables. If you dislike that the name matches the name
> of the newly introduced structure element, find a different name for that.
I will fix it in v3.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
