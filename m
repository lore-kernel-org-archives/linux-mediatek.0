Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DC8C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 07:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqRqQmGINSYGe8Tx8ZinpbocEq98MVy/i6usceXG4j8=; b=cBK53bFYomWrlnxvFmMCYghqeW
	c9S+2GdjM4i+67x0MhhVG9y+CAV9WgcLCxleuPDmpnOkHB1j7Xf6vWNo9y1s9wTqLMezNcvPvPKL4
	o/HZ1XlYJ9hoouPVTMZkHsxiPUNtQDDoJ6KFtEHXV2gNaM3f2uu9j0ki96bAcrVlzVmzIvRhs7tli
	wJJ/+nDWMteaBo27t+h5Vi8wBnuc8xULqXqdmLcmzQro37lhR4zXD/F7w0YnaB05DaMaC6Hl2Ykl1
	5wGGN63thKwCmU0YA6/Ju6VhH8T0e4wSk1zqvoDvvIZSPwxTFMjsY/2uU0RGjkmaBmfwBROTULeyK
	IFYIujOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozufs-006ldV-Kg; Tue, 29 Nov 2022 07:05:00 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozuf1-006lGC-5C
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 07:04:08 +0000
Received: by mail-pf1-x42f.google.com with SMTP id 130so12801853pfu.8
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 23:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqRqQmGINSYGe8Tx8ZinpbocEq98MVy/i6usceXG4j8=;
        b=JSLdTBUPXDgRtxyyrDBCUDbk3s47tFa3OK+WR8XhC+F6h3iSS/C3APkQ1gSE9DyF4B
         TW67GOeJHogxlwm0P3tKgnQp01XZN/tMHLZrIpV85ti88TJ5YF71IhqEjuP2rRTdcJmu
         V/eF39QuBmYVD43qLvte1gQi9CWVfE84weNvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqRqQmGINSYGe8Tx8ZinpbocEq98MVy/i6usceXG4j8=;
        b=S5qezrouz7Q25i/gF4m6keP059AzuLX4HXMiOOR5V3CvZAFt7RhapzSZaKR/BajxGJ
         F104Uiw5HKQuP7485dYny3KOxvSVYha3mzdfY3Ae2vYd4FJpxZnvVpyFwSZtbQ5UO3dy
         hmVWKZMZYJZuByWX1hR1J33K2wvajcKA6e/nrGSMvy0pQiSjgj3J4bwsOyMQruWzwmuz
         VaQoGTfDeOx8XpGUGdqyxF5I99cTOzsbZUZRsJ/mQtN3X+oJN2FXG6zrxtPQ7r1XyttW
         uYSHtj0w92hlODujL5r1iBitKMGPR/4kme+UP7L4X4IL7W2VdBCp/NxJsRLji292opi9
         u3Dw==
X-Gm-Message-State: ANoB5pkzF3u5bqBJeqXgR+vVNuoDtuTJQUiAuK9kKJvejqBLiXFnwnoa
	AdGkMF1wdk1m6SsBBD+d//WGvg==
X-Google-Smtp-Source: AA0mqf7ZhgrsG/6bRNpLxQD514hH+WiNV31/P7bdJvOlpHSDLUkiQtF8yvjzS2TPYcCbWyNig7EIYg==
X-Received: by 2002:a63:cd44:0:b0:478:1391:fc43 with SMTP id a4-20020a63cd44000000b004781391fc43mr8581291pgj.431.1669705445763;
        Mon, 28 Nov 2022 23:04:05 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ac4a:f96:259:b58a])
        by smtp.gmail.com with ESMTPSA id y69-20020a62ce48000000b0056d3b8f530csm9140261pfg.34.2022.11.28.23.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 23:04:05 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: daniel@makrotopia.org, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: angelogioacchino.delregno@collabora.com, sam.shih@mediatek.com, Miles Chen <miles.chen@mediatek.com>
In-Reply-To: <5e55012567da74870e1fb2edc2dc513b5821e523.1666801017.git.daniel@makrotopia.org>
References: <9bde77be-f4ec-11e7-e645-7c4465bcf6db@collabora.com> <5e55012567da74870e1fb2edc2dc513b5821e523.1666801017.git.daniel@makrotopia.org>
Subject: Re: [PATCH v2] clk: mediatek: fix dependency of MT7986 ADC clocks
Message-Id: <166970544357.607733.13538698332065182238.b4-ty@chromium.org>
Date: Tue, 29 Nov 2022 15:04:03 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_230407_233296_EB0978FE 
X-CRM114-Status: UNSURE (   8.79  )
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

On Wed, 26 Oct 2022 17:18:07 +0100, Daniel Golle wrote:
> It seems like CLK_INFRA_ADC_FRC_CK always need to be enabled for
> CLK_INFRA_ADC_26M_CK to work. Instead of adding this dependency to the
> mtk-thermal and mt6577_auxadc drivers, add dependency to the clock
> driver clk-mt7986-infracfg.c.
> 
> 

Applied, thanks!

[1/1] clk: mediatek: fix dependency of MT7986 ADC clocks
      commit: a46315295489933209e902638cd287aeb5f982ab

Best regards,
-- 
Chen-Yu Tsai <wenst@chromium.org>

