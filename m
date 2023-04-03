Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632CEC761A6
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 06:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PPixoHRDJ+Gnyytgct7eIf2W8PC3hRBuJOLjuDKdhY=; b=EJh6Cxfl4xspq2itKnORH4EmIR
	jPt+ZgXkba4m7B1GyCqGwB8svP9vJEo2YoivQcn5sz0FuxNlosa/8/beavVJUiQzCcPIXs0nEyA2E
	nxmIe0QTUk4qrdRcsOWrzzx7bpuREyPry/yEwvf3hCl0E0apfKKNMaAg+uAsg9iWXfS6bRAkIVoGN
	6JRSTKcrHlDk176e0N44IuUgpN7+N9y43GpMDbpgMz/b2/S2a7CbdEaOTzwSitZtAyJxcu2oM1aKH
	IdL6UHNxxapIXQ/brEiCsXIzJwxEJ+5HJztL7XGCvNN2HjIk8ONCgWvxgSqPuYQs1Si8MqkU9vvUg
	KsXPX7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjDPi-00EFIO-0o;
	Mon, 03 Apr 2023 06:11:34 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjDPe-00EFHG-21;
	Mon, 03 Apr 2023 06:11:32 +0000
Received: by mail-ed1-x532.google.com with SMTP id x3so112607690edb.10;
        Sun, 02 Apr 2023 23:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680502288;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+PPixoHRDJ+Gnyytgct7eIf2W8PC3hRBuJOLjuDKdhY=;
        b=iUB0JuzYzSTrZD/+G5G3iSZ+1srHcDapp+2yS8gUivSygEUOGHpj4cZmiOWxHvgQTy
         iE+RPPaYIQ5Qi0ZZmd24zNSLYCD3sJsMCKGGJGByokv6zZ2zCyyW5xNTZ5zOplMQGJ0R
         vgUFHkowl5yEBomYvwjill8yyhPtqe0AKiXgA57CND9aKt2qCFWEI7/f/0+r0pMXCYEM
         nhsA71AVUwIGCI1HggH0vhhR099IYLKEehb+2/sLHOUErs2O5i5gF49rZge+iRglsVoC
         t06dNmIb1MPArzL9pQYEGx9DCS+7iALBmKTPCavs4MrxLEwDUHFXfT6L8yLSh6o6H+DO
         sTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680502288;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PPixoHRDJ+Gnyytgct7eIf2W8PC3hRBuJOLjuDKdhY=;
        b=mx0GP5FraZHmedLN8QtFrnLi4KIC+DNvx95rMZyPpzM4Drt9HIHzSWI5SEsK4wF4Nf
         cjdwwgAJyPhNFqbfaDBU/UigOztXbsl5sdN+K+/rWLdvK+7Ep8jCWlfHZW9QpAPPmnmG
         XgF0TMTisTgJK3b+yc4gvWeqS7iho/3FpIUGwRx1Jn1uYJKxE27X6W2RfimsxAxOioSb
         ik4F+Nonmxt6f55kq5BGUgZL10qoTqtGI71zNGUiTvCxKrMAcOc5TkoM+otOtwEVCjwq
         G5TxhmJuurBkVGtHm04nM8idIve+LfQRtdKjKBbHf7UOVKsuhnY2h+mE6x/31UpIDZ06
         zgFQ==
X-Gm-Message-State: AAQBX9dztK2fi8E6Z0P4DwUqH4tAQ8Ek0ZjPSQCb0ehR3e7z/BeGRG2r
	7LUZH9FL5DPVnghLHDfJuBw=
X-Google-Smtp-Source: AKy350bBekRezxNQa7MFP8TwmpOwouUosfhIi/lGMrCD5/RMtWc0098xCYnOuGzvNELlfMlv0AK2gA==
X-Received: by 2002:a17:906:eca1:b0:920:254c:1e2d with SMTP id qh1-20020a170906eca100b00920254c1e2dmr36630296ejb.39.1680502288354;
        Sun, 02 Apr 2023 23:11:28 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q15-20020a17090676cf00b00947c0cecceasm3471757ejn.206.2023.04.02.23.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 23:11:28 -0700 (PDT)
Date: Mon, 3 Apr 2023 09:09:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: oe-kbuild@lists.linux.dev, ye.xingchen@zte.com.cn, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] PCI: mt7621: Use dev_err_probe()
Message-ID: <4cfaa4eb-24ff-4129-b549-bd5a66352e9b@kili.mountain>
References: <202303231145121987818@zte.com.cn>
 <22081108-565d-4608-97f7-6e40ca3df2b6@kili.mountain>
 <CAMhs-H9m=ZGREMo_upE3M48sQb-WpU3j2_b2xLyO2mDkezxC9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMhs-H9m=ZGREMo_upE3M48sQb-WpU3j2_b2xLyO2mDkezxC9g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_231130_680865_BC75CC8B 
X-CRM114-Status: GOOD (  18.46  )
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

On Mon, Apr 03, 2023 at 07:05:56AM +0200, Sergio Paracuellos wrote:
> On Mon, Apr 3, 2023 at 6:41 AM Dan Carpenter <error27@gmail.com> wrote:
> >
> > Hi,
> >
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/ye-xingchen-zte-com-cn/PCI-mt7621-Use-dev_err_probe/20230323-114623
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
> > patch link:    https://lore.kernel.org/r/202303231145121987818%40zte.com.cn
> 
> So, I already replied to this proposed patch clearly saying that this
> makes the rest of the code unreachable, so it is a clear NAK.
> Why is this applied to the intel-lab-lkp tree? Just to be able to test
> the changes?
> 

These emails are automatically generated by kbuild-bot.  I don't know
how kbuild-bot internals work.  I just review some of the Smatch related
warnings and hit forward or ignore them.

Normally, I don't look at the context outside of the email but to be
honest, I was curious enough about this one that I looked it up on the
list.  I knew it was NAKed but I set the email anyway hoping that maybe
people would see the extra Smatch warning and be encouraged to run
Smatch on their code in the future to avoid potential embarrassment.

regards,
dan carpenter



