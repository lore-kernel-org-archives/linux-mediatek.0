Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C227C77B72
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 12:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdTNdfngFza79TJjlriNkVPuTF/kZATl6LItXTeXEWE=; b=v9YtPZ3QJQfnaB+SwS5HNF1ixh
	5cWzgdWJY9qhthrAPsGUFsur78juA2v9p7t4QzVRJpD4Ao7RoS8LJS4sXUvrGZCHEYgqnIoTKewda
	dIEamqOjv24znd4E6vRz+P9ryd8TRisp74OEvB8BaYKbOugc0JshaxcIAyUs9aviX/OPx9LBM+uEc
	NABlUmAMQ9LzkeBG75+msTdj8vcXpzjkCCBxETiEpXAJFjgr2oH0aDLKrzqz9SvcHjmn+LSHIokbQ
	wIYwaDz9nNK+eQ0UU4Vs01bVtHNFiPas1wzSilrcjouST7264cgS3V3O0G4Vkto9xzg1b/1/hDybA
	PAYT4+cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poODo-00GBkG-0Q;
	Mon, 17 Apr 2023 12:44:40 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poODj-00GBiC-32;
	Mon, 17 Apr 2023 12:44:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1681735456; i=markus.elfring@web.de;
	bh=qDbD7coCJdS/2vghLIEPg9MEuMfbhlibiv4/QKu/6Ko=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=KEjOgP7eoC1d5PY6UHjH1inXCHIIDZLUn/kLNZRyKkntwWD2tiVRU60xuD2DIpdOV
	 yY5871reCDzSeViBoG7BQ+JOSZC6HgiYTOGfy54QUF3fztBcQAJ/mSsG+5QK8XgL5m
	 tdAT7alHVL99YMva8SIOzkxgo5qVGYGZmXm8zdDyX5MT3mdCy450IcfMQxLlBZ6su9
	 PkJb8o8tKK9d5E0f9pLnlyFt3g+CAjGdb3KcvVpOzlqdWit+AacQoq1OGX7K1sv5X4
	 csF/On+W6fvLyD8p20o9+0AADmvIV/UVK9qehvLbimc7cM5FjX5Bl16BpcUSLbf5BM
	 e0sjeD/2hKugA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MPrPT-1q1ucW3HwR-00Mp6E; Mon, 17
 Apr 2023 14:44:15 +0200
Message-ID: <4a357fbe-4f9d-37d1-0be1-93ca754698e9@web.de>
Date: Mon, 17 Apr 2023 14:44:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 2/2] media: mediatek: vcodec: Move variable assignments behind
 null pointer checks in vdec_vp9_slice_single_decode()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, kernel-janitors@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Guo Zhengkui <guozhengkui@vivo.com>, Haowen Bai <baihaowen@meizu.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mingjia Zhang <mingjia.zhang@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <b98dcc94-13f3-a6cb-f5bd-f1f8644d87d1@web.de>
 <0341924c-7f0a-28aa-eeae-f7de69ab36d8@xs4all.nl>
 <1d945069-00d3-7d9e-b783-96c368ff114b@web.de>
In-Reply-To: <1d945069-00d3-7d9e-b783-96c368ff114b@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6QuD1QlYQUklTPHI55F/pOJ74eoA08cFgoFR3pUXzqg7KkqkCGb
 vfSW0TZWJeguxYecDytyW8/z9+6AUkN6oXtchooluTt+S62j3IV+JyC86VDiFE65xtZa2Gh
 /68nhN6TfWRwWLTxgyzzmYPFt8D9Xlpyz2VTQlorBP/oo9rMUQTkqlkDuQ+26YtK0P6839A
 A1eAkYZIagDBFkTfXKAQA==
UI-OutboundReport: notjunk:1;M01:P0:CWNCASpe+a4=;1DRkwAqrwvRiACXmvTDeqvXjEmi
 oqdABA8YJZc/XMyY9mcjY4XPxroiRBLH/w3MpNK1GXPH8Sp/x/rSGZahYZm7U7Ry5c6d2YpYw
 GLC4ixDQ1QLfWFvzW6OtTHRmE/Dg5VjbocNbkIvuYprq50ytv7PlzMm07j7CrBMRtK9DQ9gAi
 T5Y4B1k5BHfTihy7o2w6NvdAIAe3nxOwBnR5aUgQjEWLFubluPSthoM4bvO1WLaaLzNKyJN5+
 Opg3KtWSABK5gvA35jorZ1SVmjXrlLn9pFJuEFmOQL20xydpD6wZlVXrKiOlJvR59+Nv/k949
 FhUtFYk6ij26La5xnOtnmLufrFWedksMGmOWDnmcoERfxvV4ObCaxm6Rx1huSnKTskEecso2G
 aNARatVRcVXOoIu15lSHBNF6pxAkctxLcbJzkkTL4Gb8vW30KVZ7eYM2Mi72E8IrTAdfQcgYC
 YohrIDyOvpYvkYbYj8Q3wF4pOrfb4QUDxAzICihFVXFQGo0CPoaAcRdaiJfo6SAf/KEhEd3Wr
 xsTaLG47SyU8PbszIs2cFP8kPJsZAuvuk/ZNimp3yIWgNLcXi7ifM/kkFYHZ29M1RyPf2YKm/
 K9TI71NA/iOFeGwPM+FL3Odn7EAUvsNj4bU1JgyHhhsbiazpT2NlqbAaxG3LDpYCRwF4PWXjo
 kk8naRv50fhphndGuElqL+ueTy56Fyw2xvkNnUXAMxhmkF879Bbey8JowItOV2B0ImhHqF4YO
 4Y1Bc0ANxy2d5q3Oewcr3+VSgM6h4msR4ayU+4jF8v1QbOxtBsrm4Rf7XHOsjOfSgB4pGtfkJ
 W4fFeUbInMnkj/H/YOVLxHvLW1rDW5ph8K4aTzZJcFyAWzrMNGuack9PIFNMW7KBAun9ZlxeJ
 lJ0eDPbY0nKn07JGThVfwaCKRewgIGmRh5F5gUESYo6rquJ0jhkT2o7xnimnS1U70JSWPYO08
 ooWviw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_054436_271076_857705A6 
X-CRM114-Status: UNSURE (   9.66  )
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

Date: Mon, 17 Apr 2023 14:19:13 +0200

The addresses which were assigned to the variables =E2=80=9Cinstance=E2=80=
=9D,
=E2=80=9Cpfc=E2=80=9D and =E2=80=9Cctx=E2=80=9D would not be used if a nul=
l pointer was passed by
the input parameter =E2=80=9Cbs=E2=80=9D.
Thus move these assignments behind corresponding pointer checks.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 .../platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c  | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_=
if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
index 8430098ed0b1..562fe07d3731 100644
=2D-- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
@@ -1989,22 +1989,23 @@ static int vdec_vp9_slice_get_param(void *h_vdec, =
enum vdec_get_param_type type,
 static int vdec_vp9_slice_single_decode(void *h_vdec, struct mtk_vcodec_m=
em *bs,
 					struct vdec_fb *fb, bool *res_chg)
 {
-	struct vdec_vp9_slice_instance *instance =3D h_vdec;
-	struct vdec_vp9_slice_pfc *pfc =3D &instance->sc_pfc;
+	struct vdec_vp9_slice_instance *instance;
+	struct vdec_vp9_slice_pfc *pfc;
 	struct vdec_vp9_slice_vsi *vsi;
 	struct mtk_vcodec_ctx *ctx;
 	int ret;

-	ctx =3D instance->ctx;
-
 	/* bs NULL means flush decoder */
 	if (!bs)
 		return vdec_vp9_slice_flush(h_vdec, bs, fb, res_chg);

+	instance =3D h_vdec;
+	ctx =3D instance->ctx;
 	fb =3D ctx->dev->vdec_pdata->get_cap_buffer(ctx);
 	if (!fb)
 		return -EBUSY;

+	pfc =3D &instance->sc_pfc;
 	vsi =3D &pfc->vsi;

 	ret =3D vdec_vp9_slice_setup_single(instance, bs, fb, pfc);
=2D-
2.40.0


