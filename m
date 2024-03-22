Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E4AC47DD9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 14:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pi9aWjJbnyp/E6I/n3TitUgjkzqjL92gyFZ7l4IaA/A=; b=RUlJohoLYUi/JE9z3Qcrid40A6
	J2GST+n0N7u/Qct+vu/3fzw8nihM3vA/SK5KtS7Qp2KCBMfwKJLkFAw70d1SJZ8U1qDYgCGWJzL5l
	nNLEhuc1eM6TeFOptXkQ8RQtEgfvI8P2oIoYXyUt31l12mVhRw50agui9MfjBwZ6Gic02dsJQAb+t
	XANOvjZT09bCbuzfCqo4SfhKh+hHP+edOSFNctpqmsARrQ29BwQ7fPd1Pxhd7n/cNjbVaCt/Y8q0P
	WbMvg4Ndov1Ii4D+8NqIiyuCj0INZyNyVTFp0Nu22tiRyHm3Gb/+nCizjmyu0uKY37NE79nbIzl6V
	rge4C81A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rng8d-00000007bLr-0Uo5;
	Fri, 22 Mar 2024 14:44:55 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rng8Y-00000007bHo-3V2E;
	Fri, 22 Mar 2024 14:44:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711118677;
	bh=d/mXWGYiLtO14dGJkbwMhR4twccpqxt0u2zwj59+NWQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=upJPI5bGROmmXiAXpthmdPbRZ4S+kVbUPm0QYJQM05MHVBL7JlNqsWyZb3XipcWtr
	 bYSUa7d9U3wqt2EBNt4B+5YeG39TiALXo0Bg2kRa7BzKDYsmX10e7ObYO3SJjbzAud
	 6ibb2+AWuyMEeBLlwtH4LfnLFELo64n2p5gSZku0RGeNpd+CIbCNTl9JU9oj+2oTPN
	 tixwhdpbWUXyH/Er+g/vYgTPMJ5+DIcdqH6xxXuuVtyXThFdNrwZSlhwhR6UbJvRHT
	 kD19olU1XFG9fHt4tnbaS9sVcuaA5FdbY9T5zCS9a3gTXDVqT0NI4bnkY13JFaUiPQ
	 viEj16/Vc2Qrw==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A496F3781116;
	Fri, 22 Mar 2024 14:44:35 +0000 (UTC)
Message-ID: <6420a5c39e0a6f85d4fd5a85643d601bd1e2fb05.camel@collabora.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Handle invalid decoder vsi
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Irui Wang <irui.wang@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>, angelogioacchino.delregno@collabora.com, 
 sebastian.fricke@collabora.com
Cc: Longfei Wang <longfei.wang@mediatek.com>, Maoguang Meng
 <maoguang.meng@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org
Date: Fri, 22 Mar 2024 10:44:31 -0400
In-Reply-To: <20240320061336.2615-1-irui.wang@mediatek.com>
References: <20240320061336.2615-1-irui.wang@mediatek.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_074451_046127_7AB11083 
X-CRM114-Status: GOOD (  12.08  )
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

Hi,

Le mercredi 20 mars 2024 =C3=A0 14:13 +0800, Irui Wang a =C3=A9crit=C2=A0:
> Handle invalid decoder vsi in vpu_dec_init to ensure the decoder vsi is
> valid for future use.
>=20
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c    | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c=
 b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> index 82e57ae983d5..17770993fe5a 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> @@ -231,6 +231,12 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
>  	mtk_vdec_debug(vpu->ctx, "vdec_inst=3D%p", vpu);
> =20
>  	err =3D vcodec_vpu_send_msg(vpu, (void *)&msg, sizeof(msg));
> +
> +	if (IS_ERR_OR_NULL(vpu->vsi)) {
> +		mtk_vdec_err(vpu->ctx, "invalid vdec vsi, status=3D%d", err);
> +		return -EINVAL;
> +	}
> +

Make sense, though on the cosmetic side, were is the err value from if the =
vsi
pointer is NULL ?

Nicolas

>  	mtk_vdec_debug(vpu->ctx, "- ret=3D%d", err);
>  	return err;
>  }


