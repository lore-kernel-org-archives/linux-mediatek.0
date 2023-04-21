Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4D4C7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 07:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsFQTffpj1Xt6EEubhQjH3aWod2zGCnn4KBG/LKkMVc=; b=k/rd91Ekt8i4ZcE5gbozM7FZCW
	+kgEdSPW1VP/gs3eAm/61F80CL+1DBz5v9Me9KnRZh99PeCp4zKfC3fQjmbhCCF5SQ29F6zF9a9I4
	w6eEOXqgfbRHejTTVXFmIElYd2tSb1PdcUq8kqr/dDUegIobgEjQZS/Dn6ftNKPc6ptALcBIgPzwH
	ero+E8BHD4XQEs4H2t9/Swo2JMyVBMn5PQiHU/DTexfJ8I0dMtbLy5nW8YvuFPXrQnkYUjZfwWZZ/
	36CFMo/4FfcFK5SDLA/1ZPuqxcC4UB44u/YXcN8bOlMkw6+glAllWhzcYF2w8FGbKJv6wsI5dBAaa
	Pyt7dgRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pplg9-00A2zG-1Q;
	Fri, 21 Apr 2023 07:59:37 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pplg5-00A2xe-2i
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Apr 2023 07:59:36 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-4409088bab4so486998e0c.3
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Apr 2023 00:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682063972; x=1684655972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsFQTffpj1Xt6EEubhQjH3aWod2zGCnn4KBG/LKkMVc=;
        b=Tmi1HPl8De+dM8cYuH01zP1eu7WpzTHXIIRqdP2r7MJimFSp9mhE22JjnelGT42cbi
         4MuEOlCB4DO4bsrcvDXMkOL1dOq7Hl6OF4sgZ1947z7xRCsKGAjTYq4aY1ujkzSfq48s
         HgOa/j95PnjLn4uUVg7sFgeOVGZnivQsUeqCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682063972; x=1684655972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TsFQTffpj1Xt6EEubhQjH3aWod2zGCnn4KBG/LKkMVc=;
        b=Ga7mmjmtN/orJejnz740TCoj3PW/L87SocCYUQldfKVg1Y78SI+dfZb+vfLazPendE
         XiTFaBwcBYfBueLJ3zk3bK5+CYnZ11boaqXLGe0hXefIq3W7zi1Y6izfHNuaIPRc6cnm
         cESeId3iD28DRenYaBY5GKDEMNJWk/RDReTrDqm3D6EiR0g1q0yoL2hth6MdNe5jJwjt
         XWT7t8HoZmCIN8qwD5PhX4q9LBn/5Cb5K7qOqm5yofXYnHZntonW7XVNncI/c8JbRHz7
         8oUrKd8KOBJ22QFyml8pQg36JdaCVUWZ9g/HxsCZy88R55zLXf20NzgdEXO7J3ya2HZU
         ilfg==
X-Gm-Message-State: AAQBX9fj5FuPC3PxJYf9t8sr/7x/vzBnPzQcESGogIviukaYnLWcU9Sm
	SV8Yx2jHLvqr2gzTM5PTvU70vLlTqSZuwMFzIQ6SrQ==
X-Google-Smtp-Source: AKy350abxmzPvOdsOw+/nW5Sft49OJtVLhvaAiOW8MiTGTePQk9FTNcoDjKCrAk7Yi89F46K7XNWaTPhPpGDXRijY9o=
X-Received: by 2002:a1f:cb02:0:b0:43f:a097:5e8c with SMTP id
 b2-20020a1fcb02000000b0043fa0975e8cmr337979vkg.16.1682063972345; Fri, 21 Apr
 2023 00:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com> <20230420094433.42794-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230420094433.42794-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 21 Apr 2023 15:59:21 +0800
Message-ID: <CAGXv+5GJroyKkj8oZw+BQxiUkiGCb-RBOxnKRkURQz5T6=EvNQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: mediatek: cherry-tomato-r1: Enable NVMe
 PCI-Express port
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_005933_917697_287345BF 
X-CRM114-Status: GOOD (  13.78  )
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

On Thu, Apr 20, 2023 at 5:45=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On Tomato rev1 the PCIe0 controller is used for NVMe storage.

This was slightly confusing for me. AFAIK rev1 is not an actual Tomato
device. It should be the prototype board, which is the original Cherry
reference design by Google [1].

There is an actual Cherry derived device that has NVMe, though it's under
another brand and another name.

ChenYu

[1] Much like Kukui & Jacuzzi (MT8183), and Asurada (MT8192) are the
    reference designs.  I don't think we ever upstream the reference
    boards because they don't really end up in the hands of people
    outside of the project, and the ones we do have tend to be quite
    beaten up or no longer working due to extensive testing.

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/a=
rch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> index 2d5e8f371b6d..11fc83ddf236 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> @@ -20,6 +20,13 @@ &sound {
>         model =3D "mt8195_r1019_5682";
>  };
>
> +&pcie0 {
> +       status =3D "okay";
> +
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pcie0_pins_default>;
> +};
> +
>  &ts_10 {
>         status =3D "okay";
>  };
> --
> 2.40.0
>
>

