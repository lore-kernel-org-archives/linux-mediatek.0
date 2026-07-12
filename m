Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9775C43458
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jul 2026 10:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGH0CHldg4jiiPBZJVYaKTOv1+yLE6ScqD49SVU+0Wk=; b=gAlGx6Bn/1e3mdAoQvk9FiKelz
	1W/rF6Qo25f2S+8es4FBrRi1on2IUD/IDu2d/vFK+Wl8sl9/ecGxm4v6gKiAR5fMA5Jxy4nSX4tYO
	3JTivcah9u1KyxlyyJQLYXBJ32fRSm0IK5OA9hbee+oTl2cK+HY8WfWMI9/7hl9ETr6Ybrwon90gu
	ks4K03BGFebJgCCP16yQGD8iW0kTee/UWBKGgSrS4+bg6gAueMF5Hz/Pf7DcQG5Hm/rR2a0pxbN2q
	ub/ZHpUaPKsRXlI+maHDvIL01CbFR/z3gybz2oHMRCielwj4bymdMQxjLxpcYmmCeWBFF/D2KWnmo
	mbE3hR4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirWA-00000007MwY-037v;
	Sun, 12 Jul 2026 10:34:38 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirW8-00000007MvX-11qH
	for linux-mediatek@lists.infradead.org;
	Sun, 12 Jul 2026 10:34:37 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47362928f65so2198854f8f.2
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Jul 2026 03:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783852474; x=1784457274; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cGH0CHldg4jiiPBZJVYaKTOv1+yLE6ScqD49SVU+0Wk=;
        b=JST2Z7eRdsGbEI2/EQV/Y1lH1Us5Xaq9jRo8wa1W1bNEPHIQNIcRp6qcV+5x3Z9LnR
         iJZh4GxqiYypXIC/rI/MHU+ETuosCNJbE0Z8khl9CxaZp7fQSq635RbCnRLp35GmdDeQ
         Q3YfmElHvnzdvsYGrVun7nZ28jHAMzfV+6qvLAybTU//Se46F1NMiUJjhrJuqefC8ANo
         HW5fWu8CehWRfihjP3cs6ERkOVczrgYQa7U1FrNqDUPnW/5QAwDrDzt/7PG3LtpNz75w
         1CTmdFvhLBuwTEWTJ6bNCVO+6erwAvym7BVvoDFdstUV6PkSdF5pWTENn8zatX1ACfIc
         YJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783852474; x=1784457274;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cGH0CHldg4jiiPBZJVYaKTOv1+yLE6ScqD49SVU+0Wk=;
        b=CbFJ0xE5XqfSyVsAEOf/0Sg3hxwn7nJy6F8CehAzSkyrlkpgfpZpxpymgtHBZ7OFWO
         4kydP5CRMYGm8diFuPrND0yeXTDQTgJ4jqjokQxldvgbW8Bo3tpPSOxHjvAkkOAM0ot0
         QHO/H6dyhZjwtV7X4mjn0x8/s0EL7gAdV2cA8uNYy4Q2BxtFuM11y7mYsk6UwikW3utm
         KHrlt6eJ1+2s4AiHxnTwijkSfj8MQbEardmJUsOX+lvlWaHG4V2li4eya9lCsFyDN/is
         Wvv7dm3ibHh+I1No/DXBoIV6Kg8v+uTy0kWveM87XWjdFoTA8jGu8T+41aOB+nIaB2vu
         ZGmg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9IfItOZ/8pDA2UpiZIXoA2RikOUla2v9KKTpG4/g+SWNCvLazr6bX7EWfStYXpSuHbIs4r1ho97UHjnUHqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKH8brezIbp6CbCvRMG8oggTGkNWv4XnJeSFWHqlOwAxCEftKy
	iSPU77kODkxUlK73Eb77ze5wDnE+Ga2q1+eHQrTNuTPHkWIixur7oRepLVSatydO
X-Gm-Gg: AfdE7clsa/oVYhkF2Sq8JdAQUeRZvc2Hf7Cvw26bFIaDgsIOuRUHO9FKQmDqEt4WJGH
	wjvqB6cuDhTcA/WG24HjxbpJ2kwBfySqusiS944EyTfLfvL5mrwTpvPhP5VVTWFo8zzu50bVIu5
	nY41XHdSI5rvP0QufypW1e9/44oFZl9gltq0nG2uj/pSX98CiC8DAOyiy3lCy3JVDOn8zh7ySIE
	mT8G4CNG9+2wIJdMFUAXRKMVHMyPCEsOtoCKjqeeLo+jH+OoeGJzbEYSovbLuACm6csQJlubDBI
	VocsRUJfd00Nwt+gX5BVOKdd82b9UnKiq2JfF+OrfEu8AcudPBuYaR1Dv1dCaWhHXbe74vUTLGD
	BKhrB6ORAj4AlbE0k+Mo6Hic2vJIPWfGT2gSK0AFkvzX8BTunEMajH/22EEAdR/n5L9Qha6HN0n
	BAo0EJrSiw8O/2YLdHiwiMltdNE2nmvgTqAesI43axWTSt3JEqwD2G4YmoaTdKIbcrGyp1KgUSf
	R1wtJVV2H4s8rVrb/uun62pVOHiN+dt4yLkoNX2sPQXxJDX0R1OCwNBhdWKU+DkHQHCa34nDbS3
	ZKfc5RYmf1Rp2uFr89i+FjX4wxYO95YUMjpIVxmep+G6wIEr2w==
X-Received: by 2002:a5d:64ce:0:b0:47d:fc33:df0d with SMTP id ffacd0b85a97d-47f2dcf78c3mr5789388f8f.58.1783852474054;
        Sun, 12 Jul 2026 03:34:34 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm84880696f8f.17.2026.07.12.03.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:34:33 -0700 (PDT)
Date: Sun, 12 Jul 2026 12:34:32 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Cc: rva333@protonmail.com, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5p?=
 =?UTF-8?B?Zw==?= <u.kleine-koenig@baylibre.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] iio: adc: mt6323: remove unused header
Message-ID: <20260712123432.15e39bd9@systembl0wer>
In-Reply-To: <20260712-mt6323-adc-rm-header-v1-1-d96395d1a323@protonmail.com>
References: <20260712-mt6323-adc-rm-header-v1-1-d96395d1a323@protonmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_033436_284158_96D62254 
X-CRM114-Status: UNSURE (   6.87  )
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

On Sun, 12 Jul 2026 09:26:36 +0300
Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wrote:

> From: Roman Vivchar <rva333@protonmail.com>
> 
> Remove unused mod_devicetable.h header.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards

CJD

