Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4148EC1117
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 17:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8S3D2amG83bMjq3rYrixdtz5QNwrXVFuIOF99KB48r8=; b=TcBOFFw39RdP21KxxGqyVGjqk4
	1YMKnoQqxt2ZJJxW+LIgmwTb9ArQIK9l6nSBunZQpc9GUBx/ZIl/YLa3DHPD5Y/FPCYY/p8YPYMTo
	kSnactmadu9iKcLsBknjIs4ERhqRmubkKFUs0uR7iGdO8VcOx7fa+DCGC5nJLm0CaCXHi16QmCuZ2
	/eoCfEjl2UwRsJwT8haqSjUvSb4qXaL7afhwQRP7/muIiGO+E8fweua2Wv74icIkp/8GY6+8+gOKC
	+uxi3VkQVEObZMMCZ2LJe/QXnbauiPUY7C9soGzxSOcBGpFNn8dJZ6mzEga1XxVVeEQDwGY2yX5kt
	GBjSm9wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vua9M-00000000ptK-0Eyv;
	Mon, 23 Feb 2026 17:55:16 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vua9J-00000000psg-1OvL
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 17:55:14 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-1271195d2a7so105401c88.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 09:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771869312; x=1772474112; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8S3D2amG83bMjq3rYrixdtz5QNwrXVFuIOF99KB48r8=;
        b=QSyg660UlKYrFi43YIwDo2LyEuZ3g3QWKTg/ARY1HOoEu/MjRfp9IoXseC4+HrEyX3
         4wJaw/TGXslUUUtHwcvgC9S2gfQZerVj8mfa7hQQ9VSsfmASVOq9auAbg1fJnykKa4Lw
         vogt1sBk+jvLHPaP00leOkWgam1xITucdD9/ScnsFHpCdSpWxVHKFmVtiyZBlFNl6vEW
         9Kaf4Rfa48cgh3yQfqwogC5w24dOoVJhudUnUXAY9efNdPhOZvbU/34xN6IpxD8jHSuF
         1WIUa9GuYeb0tgm6Rvd2OF+M5UCwHUeVIL4g/ahdNhBRl9Xy90+iLNXZI8WJeWxLaOZD
         f0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771869312; x=1772474112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8S3D2amG83bMjq3rYrixdtz5QNwrXVFuIOF99KB48r8=;
        b=qttI7sBY5UBjTofXnzqujngd95SzB6saG0+kNgvVOLbDZBOhr2s5Fi7oep5NoLF22k
         VVysb4S6yBA7RxxuDteyfPI6+2W8X50FL1FubrZFgjpD9qxbZvHIJOZMSLRoQgb4kWVq
         3Hj5MvK3fZQuhhRCA7YieGemIgE0NzyTnHSWMo0tFt6uNUlPE9jTqz+wVIsZJ0kzgzR1
         JvqoS5FGfGuSiHB8ZB50xMs41q/lCuBrNpy52mEJdd8VylULgAExIAGVrdqL/V4HbxhN
         8Yx/MAaxydSvSH16CjqzNA8lFzuEv0veTNOnW9bt2fM3Tky7imW+MI3M4yvYpeqxcQRh
         3WnA==
X-Gm-Message-State: AOJu0YzkqR02mLDuueSh2jlv6XSsNNpTRohATxOokd2dT7xbn4MOLVLm
	1x4swynGo2wPb0yae+yNbSdaqck3KX0hR7jd4pFLZcRKQ3oELESpOW92
X-Gm-Gg: AZuq6aLZl+8aiR9RgwxCJ1LyygmFXTEMzGKl46ml9szC3JbTD9nsyADZ/Lpf/FOfiMg
	wuEPeAOCymzILcAc+CgpDRoMV8MPnInbPdOLvGFJoSB6dm/XyYZaN7G/wIEXUBzJ/3NXWjSiJzB
	L/Jl0vZ1jktHU9AZZ2moV2VOaymIrZDD/lNVwXTbpRZynGx/TuA6vvAiUxXFyX5/mMoRS3BGay9
	mNWvsZJQD/Ofp25X8d7OcCk3mdj79VyOo+H7wIt2do65f0SqXnJY9Xdew0Qk0QJrUTxHbSc/PM4
	18UuA+/YWq3ZC25/YJ13Z+qtknnfbsHjTAKgI3RB0QFUPC0BJv75wHy1i7U4NHEyG53q1lObsqU
	PcG6VXk1NMiZwfxsht96jk7FYuR+bkYojQr2Fn04hlLtOcHf1YB+7aMKDp5mFTHlml9XQFnGUjc
	hSja8nz6euon2J1vePFUOwWIrvcF+LOb9u6+bsVJPloNRTo8X5lpp+b6mP4PMbCAqVclto1qymJ
	UU=
X-Received: by 2002:a05:7022:2214:b0:11b:9386:a3bf with SMTP id a92af1059eb24-1276ad61a70mr4534016c88.42.1771869312175;
        Mon, 23 Feb 2026 09:55:12 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:1b48:5d6e:ab6e:5287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af7ad65sm7334624c88.11.2026.02.23.09.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:55:11 -0800 (PST)
Date: Mon, 23 Feb 2026 09:55:08 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Val Packett <val@packett.cool>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Eddie Huang <eddie.huang@mediatek.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Julien Massot <julien.massot@collabora.com>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Fabien Parent <parent.f@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 7/9] input: keyboard: mtk-pmic-keys: add MT6392 support
Message-ID: <aZyUXip4zgeDUdVQ@google.com>
References: <cover.1771865014.git.l.scorcia@gmail.com>
 <2c96591313084d240ac94b9d42d91d984fa9bce7.1771865015.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c96591313084d240ac94b9d42d91d984fa9bce7.1771865015.git.l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_095513_363668_B743C792 
X-CRM114-Status: UNSURE (   9.90  )
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

On Mon, Feb 23, 2026 at 05:12:46PM +0000, Luca Leonardo Scorcia wrote:
> From: Val Packett <val@packett.cool>
> 
> Add support for the MT6392 PMIC to the keys driver.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Please feel free to merge with the rest of the series.

Thanks.

-- 
Dmitry

