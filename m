Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55943EB64D9
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Jul 2023 07:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHx9ZZkl5ZMEnvKU0DhetsvfeKgpfsIoKlJQhi8IceI=; b=12HEXB5hTw+AqMCcuAChTphOZN
	fjXH3wRwtjyY546W0nGy2pXN7zsmbusNCEppJ0Sq6Pj144pF7JAFIsPk1uQq1AXQH6iD0pcjzpw7M
	KHQB8mIHTUMCS9LYRggNIetbfwXRsbdPKDAjdIukz+N/dY92aa83ToKKC6M5if+9rSZ1XdOIDihAr
	Q9EJCvdNfRGL2TSMA7SrArKnD8b3MiuH1dYYQW4OGu7Pi9oED0UylFcur/KGi3VFBEfOK8Fiz/gl0
	vX6oo2pv3PEGxcVXObvta4TEwH8V2cAh4Kk3QLETEcuXQM7cwgtLbV66kmWVHzJXR5Dbs3As6Zo8N
	haBK/YnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFrpo-007LMq-2h;
	Sun, 02 Jul 2023 07:49:28 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFrpi-007LLt-2K;
	Sun, 02 Jul 2023 07:49:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1688284144; x=1688888944; i=markus.elfring@web.de;
 bh=BHx9ZZkl5ZMEnvKU0DhetsvfeKgpfsIoKlJQhi8IceI=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=JLFjGmWXHtFOTm1nf98oGegiuUV4QxnMmFnt9rJl6pSzUgRCctsg/uYr+MAxsO0/AgPeMqW
 VkwwEu7Lm/NXYU8LP9L38LAwyp0oCuxSxOQxYAgXi66RWTWT0yxtaNMlkxmmdMdMEi/fWiOJT
 g49tmNOlqqxwWaNKnBXFtd2B5ew/RiBzNB52fgHTYmAuYq+9LtHVwcLph1rI2P/v8e77AsrRx
 9upocQl2jABVa3bziVJ7wNlmtu1BabLJmRGRVTNfzvzCUrrHzqqQIYqP9Z7fiJ02dnj2kU6hl
 NFaUAxy+0O4eoOt53pXEHCjxZqQVYJO3uKsDV/t58pZWShSxUR+A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mmho4-1pZcmc0WH8-00k2Se; Sun, 02
 Jul 2023 09:49:04 +0200
Message-ID: <368f5604-913a-9bb9-dbaf-3a7ede15742d@web.de>
Date: Sun, 2 Jul 2023 09:48:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ming Qian <ming.qian@nxp.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Tomasz Figa <tfiga@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel@collabora.com
References: <20230622131349.144160-7-benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v3 06/11] media: verisilicon: Store chroma and motion
 vectors offset
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230622131349.144160-7-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2PztqH7KzsuGkGlyH9ZJqiRJYzUo7XjNcLpHfVCCIV4/if/U4eB
 dZk4BhYADC1udLSZbnavlDQbuq3AEjHDWrbgu86SV7TB6nhJj8tntzc8OmLuux0UFFs9oMm
 Tu8KHpRIPkLOK936PRfm53XK85dDGE2Ai/WUpT0DQLbQ+MfaaGy5xH77MzTLVlHm3UBu5dN
 0cVWMe8cDQ7BniPBfUWaQ==
UI-OutboundReport: notjunk:1;M01:P0:ufs6gWbQAIk=;ceoMYeyeZvCBuXP8GBm42rh5x7D
 m/VLSSYo2ng2sApensdO9ipNd6CQjJuplF2XvSO55YEeg7aAzZWMgz3b/13u5sWDJEiw6pRPt
 nIbRYB0sIB5AqS/0DFzP1nyV/Iqagllr/apdeoDY1AbTf+Fi6+O54dNfzW//NeFcGAJsl4URc
 ueN9KDOB5q4b2mRHnFKVcUehB13/0D89rb9VgW5dl5a7nKjHZ5HgNx4sohUqCaR+tEevz020O
 s/Q7zYXA0TnYx1GOsoJ/JH38PiTfzOKtn8d1U8EXCZgYZ0FfwARC22HqL5ZwomBd8hYEXDng+
 9YuZn1ZvfRPV3truXB3UhQBWhe5arZHKUVZlq5z7skgi37BNA3A82R4uDwP0edrWstxkAtFnR
 GlIeBX9unwRzNHHYPGCHJpXYBSLbtyNtb/KjlYfeM+UykYY3quq9XauUDDyJpnGzg2Qnl4ncc
 LEYDH+aRRP40RJ0xsLLgxPl4PxYEDRbeoJ9BZQUy6Z68/JPUpe+AsEgtV1YXXcl8dMv1gnQwS
 UbvY4PT60tI0Eytt0cDnmSrF0mS+Vu3LxIhQHHCeQpflVLF61cGOZVFjB41L5UzFn2ONaEjoP
 xeQeFJWbOyZC67zre5Gz+cEG8CGff5JaEIRs9za5dpY31C4py5gzkWZt/0gXx1uL3DLbIMWPd
 eEPhcT4tpdH+x11WHJBSvGR3a0WBLaxb713aOUR5bBF2qxmV5Y/1f1Y3WV+BfcpGMbigT8WES
 QcX7/b3Gdd9bQZp9CxNL1y4pF21GVag+x0cAmAbhNf2xGipADP8mQfnpm0i0RXEXDETj/ICsa
 XiiJIdqsRrLREVvrfrTKjTsmB+pddV/zY8A45r4PMUqngXSLo4887OrpsY1V+6L3j6y9VFouc
 bpaNpnj4tYn+jigdTfy4HbU8eW4p/Zs92OFDGfS3NXKxS6lF0kv2M5SIlGVRuqEoqQbhrMtQ7
 RCINJA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_004923_245349_44999AB3 
X-CRM114-Status: UNSURE (   4.76  )
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

=E2=80=A6
> they depends on =E2=80=A6

Please avoid a typo in a subsequent change description.

Regards,
Markus

