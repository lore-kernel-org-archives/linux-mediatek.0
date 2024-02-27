Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94BAC5478C
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Feb 2024 18:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zaG4Gr4Kx+0i0zsq6oXYlyOK6u158LHOb5Hpg9y9dtA=; b=hhWUOnsMKc9HGT6Chg0KF6ir7K
	KAWjhzimhsEk4IpQonVmGY+TEp7Oh4znIdjQTMOfMStd9JVqe3mGmedYFlW9HLp0I9ai/PxsBAujy
	ZijC9SfF+hyhQlLjjiIe8TTFlKQOa8YhWLfohpRYqIbQckmpfQYIXBlpvPCPtjRBS0cjj5/ctDKsr
	lxvDCP4Gg3XlAC8HKhuI8LnwFl1NiOilGKZha0izA5ZPElxslud7OTouH3nFuZWN7WhQF4sNCWNGE
	0nYDAgunZdar0mbiyAkimu3dMIivfZ0qph0z1UsFfwp3ZBAXgDqBTkT5wTvhDC+mZTP1634HmvNOQ
	WgiMo/ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf2LB-00000006T4g-0oeA;
	Tue, 27 Feb 2024 18:38:09 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf2L7-00000006T3f-40XI
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Feb 2024 18:38:07 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-7c7ba25e7fcso2201839f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Feb 2024 10:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709059084; x=1709663884; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zaG4Gr4Kx+0i0zsq6oXYlyOK6u158LHOb5Hpg9y9dtA=;
        b=ENGeCk1gl9woh56KVEmoQclT3UGF9lwfzFr4nxdpEXxfTw7mckrNQpbD3t3Ry9pPPZ
         GH4u0AHMVuz6F8vL9c6JYAWYbnfh/iLjUpaxYIYVWBVYMe6Uo49uEVovRBD4XzEcXdpB
         5QFuDIpx0mxecn22cznIQNTrpcEeHquwyarJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709059084; x=1709663884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaG4Gr4Kx+0i0zsq6oXYlyOK6u158LHOb5Hpg9y9dtA=;
        b=IjVJunBPf6yIB3A95+2qUwVN1RyPomtqYtRAgWNr8X0tIzo39TGJ+655eC5imFhr4o
         wYzVP81PigMsL3cth1s/Iof7q7Os7EQyARiS1RYrmOjEiffLPaqcGBlYkKOM4CJKnPwJ
         JxKIORsGnn6ijTzw3oatShI/GPQ9Lj995pw3kD/PAI8iBxb0/c4ZJ6WkTfC5MdNt1dPb
         Kb1fzmstPulXhCyxKHGb2zOHY5L8ly4KIMVYFKhFrNeAfLYsGO5Pii9vQvz6nolONvPB
         OYV9wK9eoxXlX85PwGdjK2wRemZqhw4jCCD43ITVW/jcAG0gcNb2uQelcSe8vCx+stgs
         g68Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmU69gwTB32DW93mX47+ModSxLGx1+JG9ujLpcPwhZw47lg2DMgOJGj3iC+7oC4KAKjHU+R6fj8vh13Dgo++q6dVhg1qVN17eInywzA3KDB/Im
X-Gm-Message-State: AOJu0YxqGrwXzpoyJQ2GVfeHUmQD8pzeYU2tSmBOMEhUIbEuFurp9W9/
	EysT6E3dZwY6087E+d9hbJG5RSgYYcZI9Ap/7twz/iKJMTc64Ona+we+7NgGIA==
X-Google-Smtp-Source: AGHT+IEeZR7+1yyy7wcg6Jz8cOZdq5xTguaXhSCIcOHuTDOZFBcHwqro5Caz+F2LmDujB9cHZH+DyQ==
X-Received: by 2002:a92:cb0b:0:b0:365:616a:72da with SMTP id s11-20020a92cb0b000000b00365616a72damr143131ilo.7.1709059084386;
        Tue, 27 Feb 2024 10:38:04 -0800 (PST)
Received: from localhost (147.220.222.35.bc.googleusercontent.com. [35.222.220.147])
        by smtp.gmail.com with UTF8SMTPSA id f5-20020a056e0212a500b00363ea1209basm2294457ilr.11.2024.02.27.10.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 10:38:03 -0800 (PST)
Date: Tue, 27 Feb 2024 18:38:03 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Yow-shin Liou <yow-shin.liou@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH 2/2] usb: misc: onboard_usb_hub: Add support for TI
 TUSB8020B
Message-ID: <Zd4sCyPNNjzB5Gre@google.com>
References: <20240227090228.22156-1-macpaul.lin@mediatek.com>
 <20240227090228.22156-2-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240227090228.22156-2-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_103806_028392_A325940B 
X-CRM114-Status: GOOD (  11.67  )
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

On Tue, Feb 27, 2024 at 05:02:28PM +0800, Macpaul Lin wrote:
> The TI TUSB8020B is a 2-port USB 3.0 hub. Add support for
> this hub in the driver in order to bring up reset, and supply
> dependencies.
> 
> Power-up: Issue a GPIO reset (GRSTz) 3ms after VDD and VDD33 stabilize.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Generally this looks good to me, but it should probably wait for
"usb: misc: onboard_dev: use device supply names" [1] to land and
use a device specific supply name instead of 'vdd'.

[1] https://lore.kernel.org/linux-usb/20240220-onboard_xvf3500-v4-6-dc1617cc5dd4@wolfvision.net/

