Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066F1C77B72
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 12:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wAUppwb1XgTB3vYZKNO4rgejlRYe2gMDz1cNcEyobE=; b=dahUFPItHvYk95QHKv9XweGPAX
	HSErjyON6BVsN70ABOBws7D+FJrx40MydZ+Ep5BEOeJZUSbVguWxOHtSsfzaiMQUp5eB/jgrZn72t
	Zu7VeZrGugX45IdAjgcJpKRrFgRWZuGJZlesdw+8SdbybpZsVXWbX4Y652WaPaJ2y9K4dmd3M6hMl
	NiQXRAmMGZTaJy+Amw+vEaa+NCGQ06YC1pZyFR+5H0n3xQp3D6Hd3CH+3Dj9pkD3ShwSt1pKRzuXk
	HK0ryBunDDOQUWrGSRW63uqKn6J0z22Spv1VfpuY/odluUhpmKaXk8FHcTCKrrqmFsT7HA5b4dpqS
	tC6EMznQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poOBe-00GBAk-0E;
	Mon, 17 Apr 2023 12:42:26 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poOBZ-00GB98-2r;
	Mon, 17 Apr 2023 12:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1681735321; i=markus.elfring@web.de;
	bh=/7c9gMj4NjcLvGOLI8XeYKs0UQMjflGtLvrD94aZldM=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=Yr6MzbXfXp6dUy1u9zOA1ynxGRukQ6znbHe9Xu38jlkZMWrFPs8tRDJh/MvWx5mIP
	 9nLOjvAchnSwqS9DRLdu7RZf9j6txlI5FhP8k9zaBUh2cVVkijlgjTPMn5L9pD6lQ4
	 bPRAixQJutGqTtzwBpm8ZcKsNA89Ucz7N6TQIsuMBPKpvkU/IX7QodF+r+mtCOxjHg
	 FerXX+Vfzc6sLrt+1cA8iO/so4BRGW37s3GLuszDPUnYbFo7eyAfsIhgXLoBF8EB42
	 68ctrtMoP9ASeDZUL1+k4ynlSMZGOkw5kJ7niZMjEOBT/rnScWZnFD2RA7/ZKZ4KAC
	 m0DmPmrvbNtjg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MFayw-1pYNDa3oy6-00HVAa; Mon, 17
 Apr 2023 14:42:00 +0200
Message-ID: <12efbbad-cc54-0816-c729-d9e2c81d591d@web.de>
Date: Mon, 17 Apr 2023 14:41:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 1/2] media: mediatek: vcodec: Delete null pointer checks in
 vdec_vp9_slice_single_decode()
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
X-Provags-ID: V03:K1:dmpSxqFnjQJG39btpsm/kJMi8zW5CbPNG2lpTaUEWts4Tb1l5n5
 j8DBuas0b2aKLCdMHlPQ2hupkb6bMJa45EtyuOq/LUSYnyiy87LEnoHQ5CyBJ9tSGctQOxz
 VvEge1nQ6mKXNb3HjKiL/r0qjwxRRiWaOtAGOALFMxQDjR9UxTa2QFb3QokMpDdAVd7n+Uj
 CaplmyzTnzmvAJo4ifPYA==
UI-OutboundReport: notjunk:1;M01:P0:Easlr+g+S+E=;dHeKA2+2cVRkKDVnkADABh4UljX
 OnDwg80UsQK6yGs6txcyAnJMy0jlbSqmhXzJB8eHxNzpPuaPFFmoOwh1KyK/Qx+jUK/ctUr9e
 FTiCJm5dHw4JgX2KpEEROgom8M6vKcfLcsGb+U+XAgTHNctyzpHBLswx+WJLpitCK9qHMX9TQ
 fGPsppc4/TWkNr2SsU/UMbo0V92Q8inaTD5OngjfXFaaiRqrlhUOj0DTe9ptMGi9uqzSyETXS
 BiIsOfwdcC3Ym8Rw10wK2m3u2cus65xkTUUC61JHeZ8llN9j/yxoLCbcrNtdQNEuaoIfJ2cVW
 5XiyyKgAU3V6NfjovRsyK5aDn5yKQBQ61LEc6hFvLOvot/H4ocHXP9xwb4MHnC0m3ZQZg/TO4
 w3w41y1FuODY79hjubw08GrIf5qYrrgxKwqFtri10O6kCo4/M85toriF8kFcr8f90PegVYFOE
 OB+RfnqGj6TpWn3NwJc6wHj4OJJeP8TfGH1l9s6/Z0BdPIHJetNY2UOgx3lSgVcF8nkyFq6r0
 /Lz3EH2Esr5wEGyx7cErGLGH8HTxSuNWdU/7Fpi3ew+o/olKfvSqs2Mol2df2+NPPWb1N75pO
 LA/gaOOTZKG4QSNE4Zbyl+pWH82CqYDqPnKE+yzHfznvTpxObkPciaoae+TsO6dYhx339+5u3
 c+dI8LKJvJE6gI+5O10KccJTaYISUAIY8mBnYQqxie8C94y0RQK42o9b7sjlToHjVHXziCJxz
 hcOzlPDDEE+ZNVICKZH4IlmDrMjsKECoFY6MWs6Q6KJ7r1wISaBdEds2dB4SJ0qqqjsyw6RzC
 BKYiydO1Oo8McfeFZ6kc4DLCkrh94WuMO9B0fNQTg12vVzrZtzuHYegLJaLGBe3hhCUi6y/s/
 teDfBz15//6hj6Drda9DdNGtZOS1zsDg90fEUPcSkxpQcBT3SX3i/UVeh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_054222_205712_63FAEBB5 
X-CRM114-Status: UNSURE (   8.32  )
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

Date: Mon, 17 Apr 2023 13:43:31 +0200

Extra null pointer checks became unwanted for
the input parameter validation in the implementation of
the function =E2=80=9Cvdec_vp9_slice_single_decode=E2=80=9D.
Thus omit an if statement at the beginning.

Link: https://lore.kernel.org/kernel-janitors/0341924c-7f0a-28aa-eeae-f7de=
69ab36d8@xs4all.nl/
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 .../media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c   | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_=
if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
index cf16cf2807f0..8430098ed0b1 100644
=2D-- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
@@ -1995,8 +1995,6 @@ static int vdec_vp9_slice_single_decode(void *h_vdec=
, struct mtk_vcodec_mem *bs,
 	struct mtk_vcodec_ctx *ctx;
 	int ret;

-	if (!instance || !instance->ctx)
-		return -EINVAL;
 	ctx =3D instance->ctx;

 	/* bs NULL means flush decoder */
=2D-
2.40.0


