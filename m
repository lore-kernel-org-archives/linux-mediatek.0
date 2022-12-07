Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6919FC352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 17:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9qhhglclNe/Y+Ww2TBaF/Rt3nwv66/xfoqUyqPeiMww=; b=l8A2md9DVgcHySQmyDKPDPV04T
	C8Ar/XD/BK54HD4KX4pAqEdX3anonL7XjY2c38HUjFYPpwmMoZhzYtpRqvsu+9Ctf934UwV9VyMbu
	y0ZE3XcNbqJ/X1rX0r18TO2TtDUJO5NJXzyUWuEW4rrKkjKvQ22V/tcchNHonQd+POhI4GuptwfI/
	M1h5IFpdl798WZaYegy/7AmKlsDGH9Q6GbkZ9UzNlh+qX7EBCTcLDM5qgeWFYjD/8zcMgqSAWoDa6
	BPKwb2jHGrRAhuxL+AalSJbh+IAKK6vn4VBN6gyFO5jnuGgTenh36qiCUK0dabeetu8Fw8hWEk0Jx
	SrNHqVpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2y9J-007JOi-OF; Wed, 07 Dec 2022 17:24:01 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2y98-007JHz-Vt; Wed, 07 Dec 2022 17:23:52 +0000
Received: by mail-oo1-f53.google.com with SMTP id t15-20020a4a96cf000000b0049f7e18db0dso15080ooi.10;
        Wed, 07 Dec 2022 09:23:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qhhglclNe/Y+Ww2TBaF/Rt3nwv66/xfoqUyqPeiMww=;
        b=Qaec7jxAdBLESKW0x0+bXqyIu1FaMDo9bqB9wyeeEqH/D4nyjAPWg4jmz9YaoieVNj
         Sd2zVByvOQ6iCdxrqQH6B7WpvBcEGy5yCD/9hUJs2VT6U/ba+VL9iROojW1bEagZmMG+
         oIdglKF2a+RaTRJdOlXzTanAknjWrZVg/9sCYBKX2OEfox1/9ebvoeyjY+XGTliDg04+
         b1B5AxXSZXXbFD5eGncdAL2Kjtnre+s6uOUtzcnepceqU1cLvRIDOvoh39tRjpkoq68V
         PXF3v9VURyvtkV/VLbBvf/0BSNOSbb5Aee0FLRY62WYAjtY0T88kPI2RlMu+VG0/V4p3
         A26Q==
X-Gm-Message-State: ANoB5pmrJAV8t6jcQscBu9d5U92TvjsmmPAst8JqSjtmURrJnzAa1Vf2
	riNNewVf2+k+l6gPVpWMpyz4ppFPZg==
X-Google-Smtp-Source: AA0mqf6Rie1pRr+wry5Yh3B2mB24YYud/ZXySwS1VnTqqk88pTw8r/yGavdUGW7iQk1zoJz50LknPg==
X-Received: by 2002:a4a:b145:0:b0:49f:449a:5f6c with SMTP id e5-20020a4ab145000000b0049f449a5f6cmr30324598ooo.93.1670433828843;
        Wed, 07 Dec 2022 09:23:48 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t4-20020a4adbc4000000b0049f5ce88583sm9112297oou.7.2022.12.07.09.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 09:23:48 -0800 (PST)
Received: (nullmailer pid 2437289 invoked by uid 1000);
	Wed, 07 Dec 2022 17:23:47 -0000
Date: Wed, 7 Dec 2022 11:23:47 -0600
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Steve Cho <stevecho@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Benjamin Gaignard <benjamin.gaignard@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, linux-mediatek@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5,1/3] media: dt-bindings: media: mediatek: vcodec:
 adapt to the 'clock-names' of different platforms
Message-ID: <167043382716.2437231.1367322252075275050.robh@kernel.org>
References: <20221206064536.16592-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221206064536.16592-1-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_092351_047366_50F2052A 
X-CRM114-Status: GOOD (  11.83  )
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


On Tue, 06 Dec 2022 14:45:34 +0800, Yunfei Dong wrote:
> mt8195 and mt8192 have different clock numbers, separate 'clock-names'
> according to compatible name.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> compared with v4:
> - change min clocks and clock-names from 1 to 4
> compared with v3:
> - rewrite clock-names according to different platforms.
> 
> Reference series:
> [1]: v5 of this series is presend by Allen-KH Cheng.
>      message-id: 20221128143832.25584-4-allen-kh.cheng@mediatek.com
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 41 ++++++++++++++++---
>  1 file changed, 35 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

