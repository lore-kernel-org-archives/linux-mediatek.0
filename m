Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 154B1C43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 05:39:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6087214F1
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 05:39:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E9D2pMLD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnE+7oOa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6087214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vca2obij1U2hIWSdGrW8F/X0rFDKmNRPTtpfaIl0nJA=; b=E9D2pMLDvyoGQwkOc7nluYEmz
	XKhsUykBH8zlxk/kmDf9IJ0jhaluMn0a5VqRZ3xSGzCc6b1r/ZCVrz4oucGsXoKOyOR8XHZBEMsSx
	kzPySMIy8TeASswZ04nBCcorlklNStaKtQjJGpiCC2BbXmfCWAk/3Lm9i3GuUd/kK9R4Shm6NM/iR
	oOMfvgDuAkH3+QEcxIG2WZyifEHWvwjBftkbmNHbhJc2mlaOTF1QkfUztfNxFl4FK95oVmw9f4yXi
	F7WVOmIw5i3l36S80EoD3dNYkdhgCyT4Qex8rtB18wNjYuDefwvEOPnoNp/lQK+d2kaW2Azjxonpn
	IEVhv/QfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHhDS-00083s-6J; Mon, 14 Sep 2020 05:39:50 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHhDQ-00083R-66
 for linux-mediatek@lists.infradead.org; Mon, 14 Sep 2020 05:39:49 +0000
Received: by mail-ej1-x643.google.com with SMTP id z22so21349020ejl.7
 for <linux-mediatek@lists.infradead.org>; Sun, 13 Sep 2020 22:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=0ftNeFkIdq9io+RywVag+/vyB7FE8lzg55s4F7kUuI0=;
 b=SnE+7oOa5bqFRiQs4WAusSe6Hmnjw/2MoE3kNjWOVoqjIkYOCaa6soNFn+qIClrrUd
 CYYchI+hUPm/RH2nBzIwgwXZ3+uS4jicw+FWXAv57JbpBM7qzK9x2taUVABBNHV1HqBZ
 LCV0jYAFXId2pR3Ycwg3czyks3GOiF6L88Gz86PKRNMbNpdVQ0x6EuRcZ+pSTvFQA1xN
 qkM8Aa4nMna5conpbmUosbDDaEU9KsBdA+552ockHTd0Ob4eh3b/IuheouFFYvWui9Bi
 pffDCxDf9wCMPVyNZo0NxEfY2eEY33P67m+2P2l0lralMpdFPv21s9DOPfLcnSHTSMEI
 1VyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=0ftNeFkIdq9io+RywVag+/vyB7FE8lzg55s4F7kUuI0=;
 b=m7vd31/+TVGKTgUXRk/J0q7mg9bUn+6GuiZYjLajSibGulOintAQ2mGxmXYgcRP8R4
 scRTljT/xpDKHwLwYnOKJw2tp7WhoV84iU9ZNQbMvX+OUzJoKO6JrXI3x0uOvKDWQtOq
 rDAi19QT3CJV+o3wjkGK1MHZ4HqyYQ+BqfarH6V0w+tmQi6zYzVgrZrdTwKZRVpRuDzu
 YB6QwApUqoptq5XTlYxvwBK9bh2b5eoYCdQ2o1vgUpeN7/wVm3fKrgSVU39TDxB2Ijsj
 hGTsFsuwpjvXYMvwhcRJvvaXv2nizpNi1oR3pt9w9Tc/ZHe/KeuD26wmAhvmcI8zA6cU
 FuDQ==
X-Gm-Message-State: AOAM533imhxd5wGDlyoXY651p/VA8b4SIftY/iFRTri9aQ3V55XB0CQH
 L8EFHttEnnWq0AZDVdvICB9XzBZ4HZZgytpH
X-Google-Smtp-Source: ABdhPJwYE0wstxgC6zfi9o0oOP+ME0JkQsXu3OIXAIXkBT3aQiHB87ndT7jRCyc625JJFYlGFM4S4g==
X-Received: by 2002:a17:906:1185:: with SMTP id
 n5mr13091694eja.495.1600061986990; 
 Sun, 13 Sep 2020 22:39:46 -0700 (PDT)
Received: from felia ([2001:16b8:2ddc:3000:7936:d9d0:986e:cca5])
 by smtp.gmail.com with ESMTPSA id w8sm6899298ejo.117.2020.09.13.22.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 22:39:46 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 14 Sep 2020 07:39:40 +0200 (CEST)
X-X-Sender: lukas@felia
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: make linux-mediatek list remarks consistent
In-Reply-To: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
Message-ID: <alpine.DEB.2.21.2009140738570.24617@felia>
References: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_013948_247991_988F6D30 
X-CRM114-Status: GOOD (  15.94  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Bjorn Helgaas <bhelgaas@google.com>, Joe Perches <joe@perches.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On Mon, 14 Sep 2020, Lukas Bulwahn wrote:

> Commit 637cfacae96f ("PCI: mediatek: Add MediaTek PCIe host controller
> support") does not mention that linux-mediatek@lists.infradead.org is
> moderated for non-subscribers, but the other eight entries for
> linux-mediatek@lists.infradead.org do.
> 
> Adjust this entry to be consistent with all others.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on v5.9-rc5 and next-20200911
> 
> Ryder, please ack.
> 
> Bjorn, Matthias, please pick this minor non-urgent clean-up patch.
> 
> This patch submission will also show me if linux-mediatek is moderated or
> not. I have not subscribed to linux-mediatek and if it shows up quickly in
> the archive, the list is probably not moderated; and if it takes longer, it
> is moderated, and hence, validating the patch.
> 

Okay, my patch showed up within seconds in the archive:

https://lore.kernel.org/linux-mediatek/20200914053110.23286-1-lukas.bulwahn@gmail.com/


I think the linux-mediatek list is actually NOT _moderated for 
non-subscribers_.

Please IGNORE this patch until someone can confirm if it is moderated or 
not. I will then send the patch that reflects the actual state.

Thanks, Lukas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
