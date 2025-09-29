Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B79CAC5B5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Sep 2025 09:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0UzoMEpxwYA11OgHMzNuzA/C9K31n+vXlsLGo3esRlE=; b=F/YxK4MCLAVpHgpZ0Dy6Z8AEIa
	mMAgE6Sgd0/7tCxblSDAVrMGXl3jQz6ZnOO1p3CFX2K4HPhB62JLrP+59ENVoNSgKsfU+WlA+woFP
	+ZXSheEhSwagP0mPpn2/URFLVmrvEh2rLkNCye0NK890PyKIQi4rSajlCoWekT6ckEzMPsHG9juBm
	MXB/iMB7jOrj7fwwktauLG046esDTznCIt/0z8vsxI2MIR9ZfB94Yrfm7AZbISGq1Zt2i0D8HUkFD
	z5CoL4jIcmh9NTFSF29fqvl400nD0c/6japaYidEvlSSTOpjVImgBQqn4MgmrsFNeWEum3mpzH0BS
	probeQAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v39uc-00000001t7Y-2Lr4;
	Mon, 29 Sep 2025 09:11:14 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v39uZ-00000001t5i-30Ni
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Sep 2025 09:11:13 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-27d3540a43fso48438775ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Sep 2025 02:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759137070; x=1759741870; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0UzoMEpxwYA11OgHMzNuzA/C9K31n+vXlsLGo3esRlE=;
        b=EW43jtDgnM+SL/YV4IKzam1EJDv5tCL8yVISuxKzoFMTqMRr5wpf0TMabQCUvIH/1p
         jAc+IJVkORWa1Md/VuKCB4Sp1qCcSR7J9Ra5obAdmx1+T92ECvcisjmiaPIhL/RFNnSl
         xoWj+pMSTF0j07dKevjh8O93BJOyppN+LdvibGFZBD7cj7uhLLatqgi4F9zY0ulEqMBa
         AKQlXnQxiuQiMf7PrYAv3YpLHHfjTFuuvj9hrfkttEJiFbVAubVfcvEv9j+kic87nP6r
         Wfichhjbll5bpYhsQD1QhMrZKavXbeTjW2lw4fVaLLJ0iFWm9jIsi0inS3RJYIvip7e7
         Arqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759137070; x=1759741870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UzoMEpxwYA11OgHMzNuzA/C9K31n+vXlsLGo3esRlE=;
        b=iabmJcIJgrDcuA4e355Xp8qrWniIzwuZ70dmjwgiTmtQQ/kj2LtGTVajfjnGHymch6
         ezypHB1eHQqeRp4Ck3CfZZBbCTaYNlec9ReZ08UMtHBhJoCEht/fSrc4Tde3qsc+QP6C
         3qUAiil8xZr8j463QJgVwHu2IeEgWiTyxLFYIQaXZ3OGsCNesKpQEtMSo7fPuvSi3f6d
         s/nZkInXtQCMWY3OrsXPP0pPPiXbQ4SdJvHrx5oJU3DzSrUp38qRzSyjuEDJhN3nrBRx
         E+MTIRrhF6YgjCvQmrBsq6VSSMVAlsm9kTGuwKBquZNeGHRAIYqPf2rnKl/y7Y4l55bU
         Wecg==
X-Forwarded-Encrypted: i=1; AJvYcCVDibL78qCLmgIy/AmrtE6v7i8tD9M2IbRj40+nP0ApNR/lSvREtyLEGn+NSDtSvffhrl6p1zK68fneGeSQTg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8/pVRUUagDUMS9XpJVsQsvgzNtsAXMNVg/1VGxCBJyGwdoAJy
	N3VfUvs2s/AELElnT9r+TDk9jZhTmcHJEooO/UiC1ncCPZsMjX+kmhDbmJR3wZ9pNSs=
X-Gm-Gg: ASbGncuIDfNak5l973IaTuOG2MKj0RIa451pzhr26GgRpAKfbItcrGzOLKt8PLoTUHZ
	q5yilkpgQ9FH7+xOhBqQ24f9gnV2FxPHewIW9C1M2Ln4QIARNPuWXdyZnNPyoarX1NGi0Y0ENiK
	rpssPEcUSnDXCyMCgePk9qlwG7WyKV/ukixZxTHMG3e/VNU1eVZ/HApxIP8Zcq4hdpibvipcKii
	kMSiVacHhNIZbGGGY59HdbSfYXxpAxQq9z3K2HSVEsA/323NQJDVgwMwlkqbB3JWChKh93MxjvQ
	Hq8kk1dBlBRKbhojycURCQDlGcsxL6bb2IeqgwsNnMDkfYEMN/L4K+Lbe+n4xaPzE9Yivvaqtqc
	90seVQ4lbrVTdBxdNA9jZ6Vek
X-Google-Smtp-Source: AGHT+IE36qC4gdaY+djdCS+K2gAOuhROlHGPGFHjHQiGsIGh3DmF86iNkcqZhdF2hU44jns2gHjhyw==
X-Received: by 2002:a17:902:e5c2:b0:26a:f69a:4343 with SMTP id d9443c01a7336-27ed49df6acmr178971505ad.4.1759137070390;
        Mon, 29 Sep 2025 02:11:10 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cf181sm125192125ad.28.2025.09.29.02.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 02:11:09 -0700 (PDT)
Date: Mon, 29 Sep 2025 14:41:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH] cpufreq: mediatek: fix device leak on probe failure
Message-ID: <20250929091107.4xltfrms2zdnhov4@vireshk-i7>
References: <20250909073819.25295-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909073819.25295-1-johan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_021111_766218_B93E87AD 
X-CRM114-Status: UNSURE (   9.93  )
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

On 09-09-25, 09:38, Johan Hovold wrote:
> Make sure to drop the reference to the cci device taken by
> of_find_device_by_node() on probe failure (e.g. probe deferral).
> 
> Fixes: 0daa47325bae ("cpufreq: mediatek: Link CCI device to CPU")
> Cc: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Applied. Thanks.

-- 
viresh

