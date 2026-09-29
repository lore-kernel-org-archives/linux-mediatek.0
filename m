Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3259CA5FA7
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2026 20:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=770xEhvBw1Dn5803XOi5/66nDa+u1CSmAxJ8KSDFNxU=; b=GQalMEx6zxGJSsI7/Hr6ckt7Z4
	VpZua0yCckv+0y2fUQzlO71dOp+5ZOIqKJ0je5bMD6VMKHmEcxdqc6f5tNsefN8Dg7DZgy9ecl2Dd
	Hk3EWJ6IpsABNootu85oDWp8DB/tJ1pKNi6lqIybIcKoSxuRPOfXatT+BP8AIxcF+aIM4/Zyi1tLr
	QiFee/RSSPGAMChtXG4l18nmLGK6qSaQKDUB2e1QS3D1yw0WVPjkRYsW1E+P8Fqr3r/6osFCeZcQz
	zPNwYGx08rFpJA4fLr75Qiiwh/ZMUYb3EdsAuvmO7iIrsEIg3IPBd2VZEmTH43rC0Jd1baNLDW8xw
	JzeiExFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBe0K-00000004Rgh-3Dg1;
	Tue, 29 Sep 2026 20:00:44 +0000
Received: from mail-qk2-x02.google.com ([2607:f8b0:4864:34::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBe0H-00000004Rfi-0en2
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Sep 2026 20:00:43 +0000
Received: by mail-qk2-x02.google.com with SMTP id af79cd13be357-93c5ad75c17so246573785a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Sep 2026 13:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790712040; x=1791316840; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=770xEhvBw1Dn5803XOi5/66nDa+u1CSmAxJ8KSDFNxU=;
        b=xYrDOgsC8KEynXJnltcClHQzvD0Le/v8V5DG8m9CDzM4aP2sOEJteNN3ObTM5AJ/j8
         WlcOQO/XfcAIb6MeiZfO9VY8hm23aucSBCJlH3yGa059N9vzw5oQdq+bboJoyksRTYas
         f1MywY+HScRPT7/agrR90XO2xHAKPatiN/kCw/PuO05QEi3v8sgOs1vETR2nQCG0MN/1
         db9KAe4Ino760mFB3C5a+7bJ7QU8tWpO5I2eTIg0/x4geHJs9iYZV34q/6wJYrG+PS4U
         PxFl7bixc4i2BVubHHOm1qVe8Jodaw9H9Y/uWDN9yALY7Hs0QxfGiH9wjaD++qjz/hx4
         7cXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790712040; x=1791316840;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=770xEhvBw1Dn5803XOi5/66nDa+u1CSmAxJ8KSDFNxU=;
        b=MUa5sFjYSlZTqfz+dCcFcniqZNHqU0K5X87qVNl1X+XONpnUyn/6a+yfGK+1rtxy/V
         H7ktb6hiBa6NZbMG9t0DSl1+TLMOzVfheug3yIvmFMMy85pbwzrllbTjJ/MHev8FBCfx
         ECKiNI5zGL+NTvSBop5/WC927aFTa6TMHyKElmfI6sIgzgYdoMhKyB7Uyeb6dLvyVNN+
         x8/jWqntxjNwt2wmjDaeGELIP7w2hQ4fs6do1c4Mmh/HomLBLtlbZs0sGftTCDiX2CVq
         DnAkQ1ilM4AaSKk7uyAH+qnjkPVWQR7Amqps+/AAHS+umrEH0l804GIoPRdZJL5Hr7Ew
         7eYw==
X-Forwarded-Encrypted: i=1; AKwUvBwxuGndylBhN2DSdAvfchwTawwDl7VdNEJakUQOWcsjHjNogEKM3aCLMnZgdElEU54HJv/JncIQqv22J6PYkw==@lists.infradead.org
X-Gm-Message-State: AFuF++l6MaUeiAxrDjO1DT6pxrD6mbRXSphO9bDfZHkqKBQZ5dI54Az6
	OrKBYvmTuoRlXhG8aMpH5tImuglHwxRStaAOt7Vejg1QDKfycquIcb1by82r4fgo/zg=
X-Gm-Gg: AYBFou2K2Cou0o7yA70YECdltKYz3ROcOcG9SEnj1m8D8BJhqytq9VhAkOwgB8g2IQ6
	WRcU4s8rJLDeDl3oqn4nMGDaC2j1wYfz2qyLkjhazOR5kP5NUDEW4HCB2ThvNs13Ud7p6kM9JPQ
	omenS8VxtxqRSzZt/IYtHGP1gPG/nc1mlEHortT4nSSagxxWS9McXH4ANxCvHrppbNCbzz53Xkb
	dX2BC8vbS52DGsr2lFjS02qUNM0s2LPoBgUkFrTNYblpNYItbuAMZ/fNfBTznCkC+DN8+4rRzPB
	9JYk09xGTHDru61dyewe3LVohQDDF3gsrOUrLqzF0AjuOsOdnFz6qeSyhKRGvWu/Tx7jE7YUC9o
	ZTQloYnK4smzSQ2oMYIvhzh0D4iJsfgXTsXgGTO8lyFB2dvMfe212XDPSyfuph7QE9C/jsKvSOQ
	vDuVI2ZtnXRX4W8vcti6i/v2OiYtld7YF1abj9GGc11IShj/Ab4kqSH9vdVUkaVgcTQUT6uG+LX
	Ua1ZJnzuulHbJQ=
X-Received: by 2002:a05:620a:2586:b0:93c:68f0:f0a2 with SMTP id af79cd13be357-93c9fc42202mr119215685a.65.1790712039675;
        Tue, 29 Sep 2026 13:00:39 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917987aa21fsm3242546d6.10.2026.09.29.13.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 13:00:38 -0700 (PDT)
Message-ID: <232d8d12f9fa302e14d22b0b1f5d659a45d83ed3.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vpu: free IRQ before destroying
 watchdog workqueue
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fan Wu <fanwu01@zju.edu.cn>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Minghsiu Tsai	 <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org, Song Li
	 <songl@zju.edu.cn>
Date: Tue, 29 Sep 2026 16:00:36 -0400
In-Reply-To: <20260923085921.496767-1-fanwu01@zju.edu.cn>
References: <20260923085921.496767-1-fanwu01@zju.edu.cn>
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
	protocol="application/pgp-signature"; boundary="=-fhr5ayFbyS+0mRQDrJmg"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_130041_313362_0936DEE5 
X-CRM114-Status: GOOD (  17.97  )
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


--=-fhr5ayFbyS+0mRQDrJmg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 23 septembre 2026 =C3=A0 08:59 +0000, Fan Wu a =C3=A9crit=C2=A0=
:
> mtk_vpu_remove() destroys the watchdog workqueue while the interrupt
> handler requested with devm_request_irq() is still registered: the
> devres core frees the interrupt only after remove() has returned. If
> the VPU watchdog fires in that window, vpu_irq_handler() queues
> vpu->wdt.ws on the already destroyed vpu->wdt.wq.
>=20
> Fix this by calling devm_free_irq() before destroy_workqueue(), which
> releases the interrupt and waits for a running handler, so no new work
> can be queued while the workqueue is drained and freed.
>=20
> This issue was found by an in-house static analysis tool.
>=20
> Fixes: 3003a180ef6b ("[media] VPU: mediatek: support Mediatek VPU")
> Cc: stable@vger.kernel.org
> Co-developed-by: Song Li <songl@zju.edu.cn>
> Signed-off-by: Song Li <songl@zju.edu.cn>
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufres@collabora.com>

> ---
>  drivers/media/platform/mediatek/vpu/mtk_vpu.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.c
> index 8d8319f..b6bd80b 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> @@ -962,6 +962,7 @@ static void mtk_vpu_remove(struct platform_device *pd=
ev)
>  #ifdef CONFIG_DEBUG_FS
>  	debugfs_remove(vpu_debugfs);
>  #endif
> +	devm_free_irq(&pdev->dev, vpu->reg.irq, vpu);

On the clean factor, it reduce the use of devm API here, but the error path=
 in
probe relies on it still.

>  	if (vpu->wdt.wq)
>  		destroy_workqueue(vpu->wdt.wq);
>  	vpu_free_ext_mem(vpu, P_FW);
>=20

--=-fhr5ayFbyS+0mRQDrJmg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarwY5AAKCRDZQZRRKWBy
9KULAP43NLUTImHqX9ivxd9kELGpFXE9g6z+OyEjshp8cbtTjAEA6v9p0zb/FZ2S
5xMDzjZ73uKB7T217AXpRwnRjKu3JgU=
=Ksa7
-----END PGP SIGNATURE-----

--=-fhr5ayFbyS+0mRQDrJmg--

