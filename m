Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665C3C44501
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 01:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/oN1wSwP4UvaqVHTQHo6/s99KohGdqm9m0b1NPOizY=; b=ViIhokagdSBLI/S6bQCzDbezGn
	H6EVvr0pGYdULN7WkWYzr3pPZscNGaSrH2uWqyN74KCld6TsMBPlTbceoHXnFS0iOr79eqXEqBXbp
	YQZSaYJj77VENCvO1gW6wzHcEllbP3AXHrkw8kItf8U5+J6v4ZvHFd6I6RIbW6EWp6Op7YgP7ImiX
	R09hG+Pjsp2o8dPfXQ7y7TYc419jzgF0aTcxRXjxrX186/ZJi8M9EZCEG7myKZy8m0qkPqNP9jg7x
	AXjAstnDPFbPWvfHmFPgA2hu9383Fc0+dXoaI/gj7mbfHEaUWEId2WZ9Htt3/I9Ktc39nsGubNYEA
	8R7eAYYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkAiz-0000000GBFy-3RH3;
	Thu, 16 Jul 2026 01:17:17 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkAiw-0000000GBF6-3gQs
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 01:17:16 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-8eeadbc5e21so19414996d6.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 18:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784164633; x=1784769433; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U/oN1wSwP4UvaqVHTQHo6/s99KohGdqm9m0b1NPOizY=;
        b=YEQgPsbm9Bo3YrgmvbTWfe8fcFvhLLa6EEqhGivTfOYY2TESjWsNWMPvHKNC5GiDS5
         FFY9s6UZAR6xmOI5MPCCaxvxAVDdqDdwfquC2WNPKNwECpMgljCahNlM/w+MdZzdmyl2
         IXBYLzf81IDf1R2C2e9VampPZNGjdxnMH7LNlzTHC6tIK84mSzFejJsjq1XDdmHWN3E3
         DdIPQ5JJQIVZAC+t7Orsoevs/a3MZ7W56WhaCMPD5c1DMxmwyeE2rSsZRbzGHP9HIQuw
         +zAAVX83ukMyMEn5QGn1ghwMjVPgb6u3Zv/Os3Bs7UttMDHtaISxv6lUjDeiTMdVanHd
         umuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784164633; x=1784769433;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/oN1wSwP4UvaqVHTQHo6/s99KohGdqm9m0b1NPOizY=;
        b=Z9v1Lad4BMBOimmjLO2T7/Iq5Jsod9eNOtR/PKLfwGueE/eTN7bN9Rq6E4tTqIRMns
         yGILxH6FkVHqDR4yGKy2yDgB/MVrcfmkxydK+cUExZpxV8hzvOJ3GMFkywmxXYpuuFfd
         wQz7ODW9bIBZE1z7V9gvTWaCfP1mQwalETtuYcdBEGh1oxl6n2vk7GvmlR6BnugjsHHY
         ydBv0sF93rhWExlzUDjdh9cCsrjlp7w5/JR4OQiYy1G2jfrGZnv34sb4cYGw4FIFVggn
         wDwH4S4GASRM/OEbRcfh0qE4UUf1TCSBXGvELtFO1cQH5yeO60kmoCTTCrSJz4srhkAF
         gdzw==
X-Forwarded-Encrypted: i=1; AHgh+RpLX1fYayuqGVSooXyRTPLJ4hwJtGwF3JtUaNnhjsiiepcrLk3e7225428L5uAJEMxNoV63T5kGyqoWgbEybA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSSb2wvcgD0LspIAsTP+o1b5lU8dUhIGcEeaU4uxrH4amMsL/6
	KLJiJvH5bUDsIN55TzbMUL6B0h1YTxpXFUnSXBiMAAWi/dyliEHSJ4V5fvhQfr62Np8=
X-Gm-Gg: AfdE7ck7tR3tZ45xxhfPvOay1VuYTcoNrjNzO4lq5qnK/faja6I5V5EsCsr/pwk4ZAJ
	Z5w7KMlJ5q8uJXVVTxhx9PNd3QFmziXmUzpzkv+stz0h7r3s05YMOqfEcpNDiINvjqUPYhbcekq
	C1zQp58f2IHtPGAJY85PgKe7/xK1f9YqrE36S+Td9ArzK+PdUeOWRfBxoIDRe1H6LYpiTSaw27a
	lyEs5g3FjXT6nnNrqadjQ/IKVShM9OqYOV12dsbLjWGVJ/Zo4CFJfrUQ+KQ3q0Y66sqdh2UBqQy
	Gr2jJDcFKdLFCGcE0klAHyE38P7gZfwutKd8t7C5mKS0v+M3QMJ7Dgtk1jBZqebr/OPLXi5NBjv
	rqHf7nOGKdOirNMuDD9JsmhyBzJuXSRX7OCKEa+aGhoDSMDnlktKRnmmVqSAnDNV57dKN0owK2H
	OHGAu1Kfs=
X-Received: by 2002:a05:6214:568e:b0:8ef:a4d5:1523 with SMTP id 6a1803df08f44-904011898f8mr225409936d6.42.1784164633345;
        Wed, 15 Jul 2026 18:17:13 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56c4cd1sm206194006d6.16.2026.07.15.18.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 18:17:12 -0700 (PDT)
Message-ID: <d4676bc9095c2c1efcd2c0f5ff4559bac7d1e47b.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: fix use-after-free in decoder
 release path
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Doruk Tan Ozturk <doruk@0sec.ai>, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: hverkuil+cisco@kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Wed, 15 Jul 2026 21:17:10 -0400
In-Reply-To: <20260615140526.52617-1-doruk@0sec.ai>
References: <20260615140526.52617-1-doruk@0sec.ai>
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
	protocol="application/pgp-signature"; boundary="=-Mck6WrMHKU/Fcl8cNGIP"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_181714_934063_8824E7FE 
X-CRM114-Status: GOOD (  19.06  )
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


--=-Mck6WrMHKU/Fcl8cNGIP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 15 juin 2026 =C3=A0 16:05 +0200, Doruk Tan Ozturk a =C3=A9crit=C2=
=A0:
> fops_vcodec_release() frees the decoder context with kfree(ctx) but
> never cancels the per-context decode_work worker first. Although
> v4l2_m2m_ctx_release() waits for any in-flight m2m job to finish, the
> workqueue handler (mtk_vdec_worker) may still be running and accessing
> the context after v4l2_m2m_job_finish() returns. Once kfree(ctx) runs,
> that worker dereferences freed memory, resulting in a use-after-free.
>=20
> Cancel the pending decode work with cancel_work_sync(&ctx->decode_work)
> after the controls and m2m context are torn down and before kfree(ctx),
> mirroring the fix already applied to the encoder release path in
> commit 76e35091ffc7 ("media: mediatek: vcodec: fix use-after-free in enco=
der release path").
>=20
> decode_work is always initialised before release can run:
> fops_vcodec_open() calls mtk_vcodec_dec_set_default_params() (its only
> caller) unconditionally after a successful v4l2_m2m_ctx_init(), and that
> function runs INIT_WORK(&ctx->decode_work, ...). A context can only reach
> fops_vcodec_release() via an open() that returned 0, i.e. one that passed
> that INIT_WORK. cancel_work_sync() on a properly initialised work_struct
> is therefore always safe, even if the work was never queued. This is
> unlike the 2023 msg_queue->core_work regression, where the work item
> could be uninitialised at cancel time.
>=20
> Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video D=
ecoder Driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
> ---
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9 +++++++++
> =C2=A01 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> index e936ed8dffbaf..30906b24c608a 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -313,6 +313,15 @@ static int fops_vcodec_release(struct file *file)
> =C2=A0	v4l2_fh_exit(&ctx->fh);
> =C2=A0	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> =C2=A0
> +	/*
> +	 * Cancel any pending decode work before freeing the context.
> +	 * Although v4l2_m2m_ctx_release() waits for m2m job completion,
> +	 * the workqueue handler (mtk_vdec_worker) may still be accessing
> +	 * the context after v4l2_m2m_job_finish() returns. Without this,
> +	 * a use-after-free occurs when the worker accesses ctx after kfree.
> +	 */
> +	cancel_work_sync(&ctx->decode_work);

The worker is active if there is a job active, but v4l2_m2m_ctx_release() w=
ill
exit this condition by synchronously waiting for jobs to finish. This is co=
mmon
mistake in AI code reviews.

Since this is redundant, NAK

Nicolas

> +
> =C2=A0	mtk_vcodec_dbgfs_remove(dev, ctx->id);
> =C2=A0	spin_lock_irqsave(&dev->dev_ctx_lock, flags);
> =C2=A0	list_del_init(&ctx->list);

--=-Mck6WrMHKU/Fcl8cNGIP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalgxFgAKCRDZQZRRKWBy
9Dh4AQCTKUlNcYoVspmnfPi3kRDiedLAR04fgYSBHBeC17x6BQEA2KPgwYaGAl39
qG4Hzu4Df7JcnRfEiS0whfRNWQzYewQ=
=gnTg
-----END PGP SIGNATURE-----

--=-Mck6WrMHKU/Fcl8cNGIP--

