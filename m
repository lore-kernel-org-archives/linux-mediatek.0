Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67324EEC28C
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 22:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwmeVddzSBrk6onBg3XthXPBezPsVZCBdsI2Jvj2LQw=; b=A+hN24sybMUtmO7G46+Iq6Cy7v
	METUtOIiBRoni6yB11YSG9Ltx+lJ2qBEcwVjc/quVHHrBKTu6En5kIuPc8fwD6NPrCn7hq4aO6iVT
	oOVUH50iwKUMfTN3ck5vDJw9/WqV1M/RQqdsmpAVJ0r8JFGJpUFcnC5q8pgxQiNaXaXKRvV0PehEn
	ti4BXHbE2zFED37fqQ6H3yWVpE+g6shzH3lq5TMFVSCKX6mN2ArxL5JlkdeVjZjUb4nZTbaLj+MMG
	EPDYR17XRz3RrLJlIsZ+0SvY9FNHsc9uYeYSScrSBbBLw+wbXt0wkio+euU4F6qHXZFJEKK5sOXi3
	MsqwKU4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vudzu-000000015RF-2MZr;
	Mon, 23 Feb 2026 22:01:46 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vudzq-000000015QE-2maR
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 22:01:44 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-12732e6a123so841273c88.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 14:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771884102; x=1772488902; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vwmeVddzSBrk6onBg3XthXPBezPsVZCBdsI2Jvj2LQw=;
        b=HNqOu8RIiwhrBoYyZS3dmmB0/QEgl7kWqePSwoGGQidt18NJLWEAoYH7u8EMdK9gac
         CV+eXBlL3oV0illc073wONBHAeVX4zWxXesOHnSLaBrmtxqpk+an6qV+EK4RWu3Bh9IA
         W6ANWr+K5ZEBRHBvTO1Ob1Ho5G2Ay6C/H89RmoA6YB79LXnd6XcOITxAI6h8mpvkBH3u
         EOZ4jbNQgMamwsWgW/3Ddv8P9Toc1kqHkaTyiUWCi6ycBlDdVD5Aq6ojjnNs4AaSyjzo
         ubAsqUk/ItL3GqcaWvH/8L5JxcYc4bTiY1BcGU08S1Skyob0EXTdBRfqQjVwDJCmYlEI
         v1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771884102; x=1772488902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwmeVddzSBrk6onBg3XthXPBezPsVZCBdsI2Jvj2LQw=;
        b=S7PTN4FwxL/s0PqK+/b6rAWXHH42OWNz/aaf1zxxaL+b/zni1SGdYlEeYQo/+e5/Ys
         N/YI6iAUAUrzaff47NlEQuP4kA3+VJE5hQ4kwiDfQoCz0e+8f7tF+V1+N99BuuvX/b7w
         hyegxDdjMmTRsJm1paN5MWHz9gic8rZbvR5vh8rJtRf9KFK/mAQNJs/CmNUmWBcuLtk/
         7o/1yKMl14ZfqPA4km/RlOukh3NNwZiljj6dQbulSelMRyFlIr/+GP6aTEqIi/7nCABi
         vT/7PXMtyScaLfhGxXpdA2rv8G07F+gy62fH7wSLd+EGo4Sci6+EKqoULONmLZIbMroL
         fIyw==
X-Gm-Message-State: AOJu0YwArRmbKWy1Mzs2I7AX36IEMIbWcD0Rnt3ROrg//5no/VHvJzDZ
	A4wUnhIhOfdqobFiyAabls8HFJ2vIzuFUBXmeS7x91m9Aj7G3Yu0V3/C
X-Gm-Gg: AZuq6aIoHYQc5ShEPxEw3PyuV26NCFHmOG0Tz6S7dws15um0JsSykfRDL2ukRNuqA2l
	MoAOlimCllTF2IwgnaM1rIRi352BfDojmF6DpGocayOkNMt4SvXVAIRvB4rnb2aiCThS8YHo+rJ
	Bf2nX3GdFFy/EpIpJNTFsD0X5/PKz3Y8PfLvn6Xu30tWwxpl2cMBKWAp8ZACbVtQjONfTKPwlJ0
	DIqkYWtYTI055lA1peCAuRsdRTcEAz0NOUoLMYR1eyYccm/jdCdG2kEcI7LdngADViwwtbbuKZ4
	CheGmrL/oQynIVa2VsueJ2rwK0+cyw5CwQq40SneHeqveq3O+JXTdoNdIxKQEDYuGynMCczIdDe
	+IRgyBgCGg1IsNnpB/qU9B4Ip6BpzoKpsjjhIcfHid7WrE2xpMcLFSUuSm4/mUCCh5Pde3XFUzY
	//Um9lMrGoOwzDPxUpNL7532NcVAoa3ypHur4nKKB2ZZkZAoH6hDJoVbr6qx+4cD7b
X-Received: by 2002:a05:7022:2521:b0:11b:9386:a3c8 with SMTP id a92af1059eb24-1276ad8bb87mr4839876c88.41.1771884101638;
        Mon, 23 Feb 2026 14:01:41 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:1b48:5d6e:ab6e:5287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af2edd7sm9460001c88.8.2026.02.23.14.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:01:41 -0800 (PST)
Date: Mon, 23 Feb 2026 14:01:37 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Eddie Huang <eddie.huang@mediatek.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Julien Massot <julien.massot@collabora.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 3/9] dt-bindings: input: mtk-pmic-keys: add MT6392
 binding definition
Message-ID: <aZzOHVh10zr9hiWs@google.com>
References: <cover.1771865014.git.l.scorcia@gmail.com>
 <056cbc09fcbb4a2845cece69209a2a564d993ac5.1771865015.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <056cbc09fcbb4a2845cece69209a2a564d993ac5.1771865015.git.l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_140142_727689_F0BD6508 
X-CRM114-Status: GOOD (  14.84  )
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

On Mon, Feb 23, 2026 at 05:12:42PM +0000, Luca Leonardo Scorcia wrote:
> From: Fabien Parent <parent.f@gmail.com>
> 
> Add the binding documentation of the mtk-pmic-keys for the MT6392 PMICs.
> 
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Please merge with the rest of the series.

> ---
>  Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> index b95435bd6a9b..2d3c4161a7f8 100644
> --- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> +++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> @@ -30,6 +30,7 @@ properties:
>        - mediatek,mt6357-keys
>        - mediatek,mt6358-keys
>        - mediatek,mt6359-keys
> +      - mediatek,mt6392-keys
>        - mediatek,mt6397-keys
>  
>    power-off-time-sec: true

Thanks.

-- 
Dmitry

