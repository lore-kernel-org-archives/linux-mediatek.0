Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1131C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 15:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E5bJwBJxT/bPRn09kBkteoghaLoO7BarL3asMOo26LE=; b=Dq8SlI4WJ5CR59
	i4lzDv0/9XBAG+XOqAxHn7bBWULIIdP0tMVIpwra3hVuzdhWberSh/X6x22VI+WgUubyTJxCcqCul
	12U6pXyWZDjS3i04eq/5Fhv01XzHCvD72YkEkLmu5D0B/bx/ouqNjvSPCVRUlcBBSWMv0jkSbq13p
	tQOcvBrnWrUVNr9R+02WMmNRYzYcD8DAzUYfUg4KjUClC3Xn3Jp50VkHjyTky4oJyr0L+Xzh3WTI9
	WRum0SG/yrtG2njCZa+iMbiLiYHKG1ZZ947FtIu9yxJUObelsemuAZPQgKx06l7B3pFJ4Lr7+Ycfz
	Qmw1vRg11zlCN7A1hU1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqykW-00Eac4-7T; Tue, 17 May 2022 15:04:36 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqykK-00EaYI-0M; Tue, 17 May 2022 15:04:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 642481F446FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652799858;
 bh=HLTx3V5C/OLEk5npKnb0rmPGaBqjbq5wK3wrkZrxIQA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=njxYRTJEyx5yTxdeQiH/V252FsF0rqTyFmDAZlpkn2YM06QBP8W6+1qSw0rk/AIwe
 gD8pfLNF97nmxJNFZsEazZrm4BaxxFj6g539Vyg0CC4cKIjgZ46hOUsjNFUSvQ+5rE
 01mXrUjWHcRJEgRlGxWbsnHBg+4gZ1r+5Sp993VYSwIEoVBwFF8s3bB4gjEPFOAYA0
 JS+ZBB4KRwxSQPBpzxARzVbcjqdSGq9iZ5PRxibTdHrti1mWjJ+Sorxs4oJTwF222Y
 J01gwsjf78f71dn6IgOGghNCV2yFJUDO+xx9Ao0hBNMylvEN9ceuI/LDY2w90sT1hF
 pFdzY1cIzLrNQ==
Date: Tue, 17 May 2022 11:04:13 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sboyd@kernel.org,
 chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com,
 wenst@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: arm: mt8192-clock: Remove unnecessary
 'items'
Message-ID: <20220517150413.pnhbvzz2upcmjebi@notapiano>
References: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
 <20220517101514.21639-6-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220517101514.21639-6-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_080424_211634_AA4E3C61 
X-CRM114-Status: GOOD (  12.78  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, May 17, 2022 at 12:15:13PM +0200, AngeloGioacchino Del Regno wrote:
> There's no need for 'items' when there's only one item.
> =

> Fixes: 4a803990aeb1 ("dt-bindings: ARM: Mediatek: Add new document bindin=
gs of MT8192 clock")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../arm/mediatek/mediatek,mt8192-clock.yaml   | 45 +++++++++----------
>  1 file changed, 22 insertions(+), 23 deletions(-)
> =

> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt81=
92-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8=
192-clock.yaml
> index c8c67c033f8c..bb410b178f33 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-cloc=
k.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-cloc=
k.yaml
> @@ -14,29 +14,28 @@ description:
>  =

>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - mediatek,mt8192-scp_adsp
> -          - mediatek,mt8192-imp_iic_wrap_c
> -          - mediatek,mt8192-imp_iic_wrap_e
> -          - mediatek,mt8192-imp_iic_wrap_s
> -          - mediatek,mt8192-imp_iic_wrap_ws
> -          - mediatek,mt8192-imp_iic_wrap_w
> -          - mediatek,mt8192-imp_iic_wrap_n
> -          - mediatek,mt8192-msdc_top
> -          - mediatek,mt8192-msdc
> -          - mediatek,mt8192-mfgcfg
> -          - mediatek,mt8192-imgsys
> -          - mediatek,mt8192-imgsys2
> -          - mediatek,mt8192-vdecsys_soc
> -          - mediatek,mt8192-vdecsys
> -          - mediatek,mt8192-vencsys
> -          - mediatek,mt8192-camsys
> -          - mediatek,mt8192-camsys_rawa
> -          - mediatek,mt8192-camsys_rawb
> -          - mediatek,mt8192-camsys_rawc
> -          - mediatek,mt8192-ipesys
> -          - mediatek,mt8192-mdpsys
> +    enum:
> +      - mediatek,mt8192-scp_adsp
> +      - mediatek,mt8192-imp_iic_wrap_c
> +      - mediatek,mt8192-imp_iic_wrap_e
> +      - mediatek,mt8192-imp_iic_wrap_s
> +      - mediatek,mt8192-imp_iic_wrap_ws
> +      - mediatek,mt8192-imp_iic_wrap_w
> +      - mediatek,mt8192-imp_iic_wrap_n
> +      - mediatek,mt8192-msdc_top
> +      - mediatek,mt8192-msdc
> +      - mediatek,mt8192-mfgcfg
> +      - mediatek,mt8192-imgsys
> +      - mediatek,mt8192-imgsys2
> +      - mediatek,mt8192-vdecsys_soc
> +      - mediatek,mt8192-vdecsys
> +      - mediatek,mt8192-vencsys
> +      - mediatek,mt8192-camsys
> +      - mediatek,mt8192-camsys_rawa
> +      - mediatek,mt8192-camsys_rawb
> +      - mediatek,mt8192-camsys_rawc
> +      - mediatek,mt8192-ipesys
> +      - mediatek,mt8192-mdpsys

This will conflict with the patch removing msdc:

[1] https://lore.kernel.org/all/20220429123133.28869-1-matthias.bgg@kernel.=
org/

Although if this series is merged before that one, it should be fine.

Thanks,
N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
