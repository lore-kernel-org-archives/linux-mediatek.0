Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B08CD637B3
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Dec 2025 21:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwZS0p27gpn/L3soQ7gEYXYui5emOyXFF6h9f3viJsY=; b=FBtVChsLC+2cuy+lmg0NpN4OHj
	zfIVHZIO52hiVdKZG5KqN6DmcN/pYWbqMpNbG7B+lI3dCTcpwJcQVtOJlpa0y0wOUHWojmncxsxFS
	GeQCZ2UEDzvH0zZ2Q2tsq9FxglrEyFVhDjIExMTK9+h6AwBOwOjQKoFureSrdHHuRLbzuO3MAn409
	a8sjL6N9QhoZ5qv236DYrlgvMJValYxc8K0fetHNTj91kMnYtFfU6hFJrdIajbFk5Q5SqL+kpOsHy
	cyOkvWhQTaZ+f8kHMae5P2fVq5khvuMVpx7+4u7Xod2WQxE5NS+d2cvxPzUTcuW1uDDxS374Z0nE9
	kxavq4vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcuF-00000005rR5-46nv;
	Tue, 16 Dec 2025 21:48:31 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcuC-00000005rQM-19hP
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Dec 2025 21:48:30 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-8b2ec756de0so565138985a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Dec 2025 13:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765921707; x=1766526507; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JwZS0p27gpn/L3soQ7gEYXYui5emOyXFF6h9f3viJsY=;
        b=ABGjNzWfusXWota+19s1xXXjIdJR4MXLdaokZV6t9ldvv8TV0Vg2qY8rLQ+GeRao5G
         yh7ARH379Vu8SumgElTYd0Cr45R2xbV6mafof8QfHznG31LCdxLXTywpzT6q2QQxVNK9
         ODmXpe1ZwpeAlosNcmD9r9x19llE0HPw3UAGkXiEhw/AsWsg9ExkqQSnEjYBZdDGAkSm
         fR0lw/z+hfc8TCUU4ASPCsDSa3DcXLyqLRlako0hMGScDKqN3rPa7iszs5i3A9Q6IFX2
         uAj8VJahDL68eBUibzx9UrxDr8AIotFqZnscGCZcK2bTi06QFWZwcs2yVfU6/D4GBGds
         dS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765921707; x=1766526507;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwZS0p27gpn/L3soQ7gEYXYui5emOyXFF6h9f3viJsY=;
        b=if39S6ADQJzXAZp4IyhA8IW1dCV0aVXuz38W0zKm9d+xqmc4bGMQoHdmHXj+jzLVVd
         6/wt/ITgU/dFH3Tmzvrc5E0yUjvwBWUZCXnoTnBkfYe7seZP/hLwXBVRJgst7vYc7JhY
         09+8cddpQDGg0KUC3pW7/YatCyvPsDMqRaE/cPe2jVSR9N0DF/vI/VTUKjqiH0sJYV20
         0TofkAUNXxwn+g7KladtmlCSbniQd9CWOSqqhn+r1uLjErE5nuVO/29HBiFZQGVCdx2F
         eDlKE8nGlaozN3k65IytVqffqu8OGZ5iVVMlA7ktIfIQT2VhN5vIF1SgX8oxRmcMwI2p
         XNVA==
X-Forwarded-Encrypted: i=1; AJvYcCWq4RbC5vgIDTQn851DHIAc8OrE0BWu6KpVxWeEt0m6QX0vY+I3i16GtFhenqCzPchGreUSXRcYkDW3FwkdzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLgMXV/70HYCA+b5fSZY6Xs6qjB1d4OU4/7rwWMbZJMNR9GrdI
	fXi1iP6hyVFg7cp4m8IeuoRY5mBygtsgSC8b/J6583KVlm0OPP/FuLV3/xReRQg8sUg=
X-Gm-Gg: AY/fxX7okTSGLpStDf0yRXrRDgwsBEXgCynNbL+qZPr7vXJ3GcmZRQCLch2ci/MsL+7
	MQTzQczYM4LHAXqSh59qjbXf/9LhNnQec5fUIcGC9AiZ3Bw4G8ypyFJs7RaFKllcUFlgjtPBuq2
	oxkJUxwlgowXjbN6kheJ2WV7gV4bT6i63xsjrwXeqMr5AIkBxonguLFUIIsQxVN3m/Bd6SobahY
	9/fDL6XWJSR3BM3mcvOZGH4D13Fu59jVyTlD9x7ELzySt2mbivAPWRqF7dE1YirOpaxELSO+NpI
	yr/EkPyYU1jr5v0xEK8p9H54nE6ckSxKbdaOey9+nnvfFdyxcYHydxXjLJ30Ze3LM8XGXu4dZ5Y
	sUxF6pAp2nHwN5co2jMfV0tIvTSMh5iHjqMNAfkT7EuCnL2WscQIMLW1Ku+tyT4o2aPew8GKbsA
	2R2TnnA1+iUtqRWI+n
X-Google-Smtp-Source: AGHT+IHdEJIMgvS0DRjgbW6ZMgMhCqitz/LqAFtaEW3RYwujlfQ/y6zantPM4DsdizBaPXHFdKDO1w==
X-Received: by 2002:a05:620a:4706:b0:8b2:bf20:f0ef with SMTP id af79cd13be357-8bb3a36becemr2153978085a.54.1765921706918;
        Tue, 16 Dec 2025 13:48:26 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be31b53dbasm269780185a.34.2025.12.16.13.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:48:26 -0800 (PST)
Message-ID: <086b940b975a9c0f9cb5d5cf2fabe21ddb188821.camel@ndufresne.ca>
Subject: Re: [PATCH v11 12/12] media: mediatek: jpeg: add jpeg smmu sid
 setting
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 16 Dec 2025 16:48:21 -0500
In-Reply-To: <20251202094800.6140-13-kyrie.wu@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-13-kyrie.wu@mediatek.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Xovv49x8gJE8muHL9N/J"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_134828_374620_38767C99 
X-CRM114-Status: GOOD (  22.34  )
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


--=-Xovv49x8gJE8muHL9N/J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:48 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> Add a configuration to set jpeg dec & enc smmu sid
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=A0 | 37 +=
++++++++++++++++++
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.h=C2=A0=C2=A0=C2=A0 | 15 +=
+++++++
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c=C2=A0 | 23 +++++++++++=
+
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c=C2=A0 | 23 +++++++++++=
+
> =C2=A04 files changed, 98 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 10a588b92e76..625dfa8468e1 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -15,6 +15,7 @@
> =C2=A0#include <linux/of_platform.h>
> =C2=A0#include <linux/platform_device.h>
> =C2=A0#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/spinlock.h>
> =C2=A0#include <media/v4l2-event.h>
> @@ -1613,6 +1614,20 @@ static irqreturn_t mtk_jpeg_enc_done(struct mtk_jp=
eg_dev *jpeg)
> =C2=A0	return IRQ_HANDLED;
> =C2=A0}
> =C2=A0
> +static void mtk_jpeg_enc_set_smmu_sid(struct mtk_jpegenc_comp_dev *jpeg)
> +{
> +	struct mtk_jpeg_dev *mjpeg =3D jpeg->master_dev;
> +
> +	if (!mjpeg->variant->support_smmu || !jpeg->smmu_regmap)
> +		return;
> +
> +	regmap_update_bits(jpeg->smmu_regmap, JPEG_ENC_SMMU_SID,
> +			=C2=A0=C2=A0 JPG_REG_GUSER_ID_MASK <<
> +			=C2=A0=C2=A0 JPG_REG_ENC_GUSER_ID_SHIFT,
> +			=C2=A0=C2=A0 JPG_REG_GUSER_ID_ENC_SID <<
> +			=C2=A0=C2=A0 JPG_REG_ENC_GUSER_ID_SHIFT);
> +}
> +
> =C2=A0static void mtk_jpegenc_worker(struct work_struct *work)
> =C2=A0{
> =C2=A0	struct mtk_jpegenc_comp_dev *comp_jpeg[MTK_JPEGENC_HW_MAX];
> @@ -1674,6 +1689,9 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
> =C2=A0	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;
> =C2=A0	ctx->total_frame_num++;
> =C2=A0	mtk_jpeg_enc_reset(comp_jpeg[hw_id]->reg_base);
> +
> +	mtk_jpeg_enc_set_smmu_sid(comp_jpeg[hw_id]);
> +
> =C2=A0	mtk_jpeg_set_enc_dst(ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 comp_jpeg[hw_id]->reg_base,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 &dst_buf->vb2_buf);
> @@ -1701,6 +1719,20 @@ static void mtk_jpegenc_worker(struct work_struct =
*work)
> =C2=A0	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> =C2=A0}
> =C2=A0
> +static void mtk_jpeg_dec_set_smmu_sid(struct mtk_jpegdec_comp_dev *jpeg)
> +{
> +	struct mtk_jpeg_dev *mjpeg =3D jpeg->master_dev;
> +
> +	if (!mjpeg->variant->support_smmu || !jpeg->smmu_regmap)
> +		return;
> +
> +	regmap_update_bits(jpeg->smmu_regmap, JPEG_DEC_SMMU_SID,
> +			=C2=A0=C2=A0 JPG_REG_GUSER_ID_MASK <<
> +			=C2=A0=C2=A0 JPG_REG_DEC_GUSER_ID_SHIFT,
> +			=C2=A0=C2=A0 JPG_REG_GUSER_ID_DEC_SID <<
> +			=C2=A0=C2=A0 JPG_REG_DEC_GUSER_ID_SHIFT);
> +}

Can you deduplicate that function. Just make one, and pass the SID as param=
eter.

> +
> =C2=A0static void mtk_jpegdec_worker(struct work_struct *work)
> =C2=A0{
> =C2=A0	struct mtk_jpeg_ctx *ctx =3D container_of(work, struct mtk_jpeg_ct=
x,
> @@ -1784,6 +1816,9 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;
> =C2=A0	ctx->total_frame_num++;
> =C2=A0	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
> +
> +	mtk_jpeg_dec_set_smmu_sid(comp_jpeg[hw_id]);
> +
> =C2=A0	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
> =C2=A0				jpeg->variant->support_34bit,
> =C2=A0				&jpeg_src_buf->dec_param,
> @@ -1943,6 +1978,7 @@ static struct mtk_jpeg_variant mtk8196_jpegenc_drvd=
ata =3D {
> =C2=A0	.cap_q_default_fourcc =3D V4L2_PIX_FMT_JPEG,
> =C2=A0	.multi_core =3D true,
> =C2=A0	.jpeg_worker =3D mtk_jpegenc_worker,
> +	.support_smmu =3D true,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata =3D {
> @@ -1969,6 +2005,7 @@ static const struct mtk_jpeg_variant mtk8196_jpegde=
c_drvdata =3D {
> =C2=A0	.cap_q_default_fourcc =3D V4L2_PIX_FMT_YUV420M,
> =C2=A0	.multi_core =3D true,
> =C2=A0	.jpeg_worker =3D mtk_jpegdec_worker,
> +	.support_smmu =3D true,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct of_device_id mtk_jpeg_match[] =3D {
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index 33f7fbc4ca5e..6e8304680393 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -11,6 +11,7 @@
> =C2=A0
> =C2=A0#include <linux/clk.h>
> =C2=A0#include <linux/interrupt.h>
> +#include <linux/mfd/syscon.h>
> =C2=A0#include <media/v4l2-ctrls.h>
> =C2=A0#include <media/v4l2-device.h>
> =C2=A0#include <media/v4l2-fh.h>
> @@ -34,6 +35,14 @@
> =C2=A0
> =C2=A0#define MTK_JPEG_MAX_EXIF_SIZE	(64 * 1024)
> =C2=A0
> +#define JPEG_DEC_SMMU_SID				0
> +#define JPEG_ENC_SMMU_SID				0
> +#define JPG_REG_GUSER_ID_MASK			0x7
> +#define JPG_REG_GUSER_ID_DEC_SID		0x4
> +#define JPG_REG_GUSER_ID_ENC_SID		0x5
> +#define JPG_REG_DEC_GUSER_ID_SHIFT		8
> +#define JPG_REG_ENC_GUSER_ID_SHIFT		4
> +
> =C2=A0#define MTK_JPEG_ADDR_MASK GENMASK(1, 0)
> =C2=A0
> =C2=A0/**
> @@ -65,6 +74,7 @@ enum mtk_jpeg_ctx_state {
> =C2=A0 * @multi_core:		mark jpeg hw is multi_core or not
> =C2=A0 * @jpeg_worker:		jpeg dec or enc worker
> =C2=A0 * @support_34bit:	flag to check support for 34-bit DMA address
> + * @support_smmu:	flag to check if support smmu
> =C2=A0 */
> =C2=A0struct mtk_jpeg_variant {
> =C2=A0	struct clk_bulk_data *clks;
> @@ -82,6 +92,7 @@ struct mtk_jpeg_variant {
> =C2=A0	bool multi_core;
> =C2=A0	void (*jpeg_worker)(struct work_struct *work);
> =C2=A0	bool support_34bit;
> +	bool support_smmu;
> =C2=A0};
> =C2=A0
> =C2=A0struct mtk_jpeg_src_buf {
> @@ -150,6 +161,7 @@ struct mtk_jpegdec_clk {
> =C2=A0 * @hw_param:		jpeg encode hw parameters
> =C2=A0 * @hw_state:		record hw state
> =C2=A0 * @hw_lock:		spinlock protecting the hw device resource
> + * @smmu_regmap:	SMMU registers mapping
> =C2=A0 */
> =C2=A0struct mtk_jpegenc_comp_dev {
> =C2=A0	struct device *dev;
> @@ -163,6 +175,7 @@ struct mtk_jpegenc_comp_dev {
> =C2=A0	enum mtk_jpeg_hw_state hw_state;
> =C2=A0	/* spinlock protecting the hw device resource */
> =C2=A0	spinlock_t hw_lock;
> +	struct regmap *smmu_regmap;
> =C2=A0};
> =C2=A0
> =C2=A0/**
> @@ -177,6 +190,7 @@ struct mtk_jpegenc_comp_dev {
> =C2=A0 * @hw_param:			jpeg decode hw parameters
> =C2=A0 * @hw_state:			record hw state
> =C2=A0 * @hw_lock:			spinlock protecting hw
> + * @smmu_regmap:		SMMU registers mapping
> =C2=A0 */
> =C2=A0struct mtk_jpegdec_comp_dev {
> =C2=A0	struct device *dev;
> @@ -190,6 +204,7 @@ struct mtk_jpegdec_comp_dev {
> =C2=A0	enum mtk_jpeg_hw_state hw_state;
> =C2=A0	/* spinlock protecting the hw device resource */
> =C2=A0	spinlock_t hw_lock;
> +	struct regmap *smmu_regmap;
> =C2=A0};
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index e453a1634f33..da753a636eaa 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -624,6 +624,25 @@ static int mtk_jpegdec_hw_init_irq(struct mtk_jpegde=
c_comp_dev *dev)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static int mtk_jpegdec_smmu_init(struct mtk_jpegdec_comp_dev *dev)
> +{
> +	struct mtk_jpeg_dev *master_dev =3D dev->master_dev;
> +
> +	if (!master_dev->variant->support_smmu)
> +		return 0;
> +
> +	dev->smmu_regmap =3D
> +		syscon_regmap_lookup_by_phandle(dev->plat_dev->dev.of_node,
> +						"mediatek,smmu-config");
> +	if (IS_ERR(dev->smmu_regmap)) {
> +		return dev_err_probe(dev->dev, PTR_ERR(dev->smmu_regmap),
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "mmap smmu_base failed(%ld)\n",
> +				=C2=A0=C2=A0=C2=A0=C2=A0 PTR_ERR(dev->smmu_regmap));
> +	}
> +
> +	return 0;
> +}
> +
> =C2=A0static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct mtk_jpegdec_clk *jpegdec_clk;
> @@ -677,6 +696,10 @@ static int mtk_jpegdec_hw_probe(struct platform_devi=
ce *pdev)
> =C2=A0	dev->master_dev =3D master_dev;
> =C2=A0	master_dev->max_hw_count++;
> =C2=A0
> +	ret =3D mtk_jpegdec_smmu_init(dev);
> +	if (ret)
> +		return ret;
> +
> =C2=A0	platform_set_drvdata(pdev, dev);
> =C2=A0	pm_runtime_enable(&pdev->dev);
> =C2=A0	ret =3D devm_clk_bulk_get(dev->dev,
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index b30c728c3712..8a61d5537315 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -348,6 +348,25 @@ static int mtk_jpegenc_hw_init_irq(struct mtk_jpegen=
c_comp_dev *dev)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static int mtk_jpegenc_smmu_init(struct mtk_jpegenc_comp_dev *dev)
> +{
> +	struct mtk_jpeg_dev *master_dev =3D dev->master_dev;
> +
> +	if (!master_dev->variant->support_smmu)
> +		return 0;
> +
> +	dev->smmu_regmap =3D
> +		syscon_regmap_lookup_by_phandle(dev->plat_dev->dev.of_node,
> +						"mediatek,smmu-config");
> +	if (IS_ERR(dev->smmu_regmap)) {
> +		return dev_err_probe(dev->dev, PTR_ERR(dev->smmu_regmap),
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "mmap smmu_base failed(%ld)\n",
> +				=C2=A0=C2=A0=C2=A0=C2=A0 PTR_ERR(dev->smmu_regmap));
> +	}
> +
> +	return 0;
> +}
> +
> =C2=A0static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct mtk_jpegenc_clk *jpegenc_clk;
> @@ -399,6 +418,10 @@ static int mtk_jpegenc_hw_probe(struct platform_devi=
ce *pdev)
> =C2=A0	dev->master_dev =3D master_dev;
> =C2=A0	master_dev->max_hw_count++;
> =C2=A0
> +	ret =3D mtk_jpegenc_smmu_init(dev);
> +	if (ret)
> +		return ret;
> +
> =C2=A0	platform_set_drvdata(pdev, dev);
> =C2=A0	pm_runtime_enable(&pdev->dev);
> =C2=A0	ret =3D devm_clk_bulk_get(dev->dev,

With that minor fix:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-Xovv49x8gJE8muHL9N/J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUHTpQAKCRDZQZRRKWBy
9BrbAP99YUdKLq0ZTZ3LnNml14X2eI0WB2yaXY/4/Dql7WGScgD/eJvjzZU2CNdB
mz06ZtidYyGgY8poqEVMEGR6DDIztwo=
=3TFy
-----END PGP SIGNATURE-----

--=-Xovv49x8gJE8muHL9N/J--

