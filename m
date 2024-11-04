Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51DAD132BF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2024 13:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/JcBLG9ZRntCDhqwrCH8dA655EdL6Qk+i6w/V5Velc=; b=QJbwG3V/uMaxJ8T8KGSWI+6n0n
	CEgu9h71fIkhSLY1p/y/NWADD3v7pzbMTePl8jfKYeurVAKP0SH3mefznDiFrUfPRwuH+9dHDQ5Z3
	oLpL1RqrbBz1gWyt+ZaMeL0DaDBoSXLY3tiZx+1Wg5ZWZz6pXXzbYRHfnWUSDxGFQIS9mfnVQgT7R
	rNWfVk5gI8742kAQW0J7o+3EUri99z5+GXrsUehnRQ5XFWB3Dbts4pwxov8AFqphMSjf2fiKJRKyX
	4kc9xti2c9DJHUK90aLG4ZqSBGudlCbHP5qnD9B6Ar0h1CDTm+CDUgDi6QESGu1seCmn6drDBzhCW
	b/yZwgTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wqN-0000000DnGr-1NCy;
	Mon, 04 Nov 2024 13:10:07 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wng-0000000DmxL-2hu8;
	Mon, 04 Nov 2024 13:07:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1730725622; x=1731330422; i=markus.elfring@web.de;
	bh=X/JcBLG9ZRntCDhqwrCH8dA655EdL6Qk+i6w/V5Velc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=dg6wG72PmBCTajz3zqwq23eIktpX+4mDA7NiR/yM9gRFG4w2lO6WZiTrqnG7YI1A
	 CPDw5TVG4ILOZe4bMIqxcBJned5HJM8dyPFWAmErKGc6danEy3DBdlWutRk0h9Aeo
	 sQW4gC8S1XAJ5rK8Na/rck/F53KDmJcigj5Kserk2dTfLnkF4ZrlAKzIIy+0YQRVp
	 /EjasB2ZeU/GK9Ysq0IluAY6GvAwZKQXpGIXjD2aqPsWZ6SgH5J3/FVaDpfDJE8h8
	 wMWwCoNCM8UpJLZKF8fqPWdcPgkGhilRiIPe4WORdj48Eu+2g3CyMiW4NJd305dhO
	 0gt/fHmKH6qIPdH86g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.88.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MECGl-1t0YOh1GC5-004TGg; Mon, 04
 Nov 2024 14:07:02 +0100
Message-ID: <c64a0c92-4528-4c87-ac2e-00ee2ec666ad@web.de>
Date: Mon, 4 Nov 2024 14:06:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Hidenori Kobayashi <hidenorik@chromium.org>,
 =?UTF-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?= <Shun-Yi.Wang@mediatek.com>,
 teddy.chen@mediatek.com, yaya.chang@mediatek.com,
 Yunke Cao <yunkec@chromium.org>
References: <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
Subject: Re: [PATCH 05/10] media: platform: mediatek: add isp_7x camsys unit
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bRyeFpZaX8wNJrlK6hdPLRc1mevh68UYevrSMj6u1GEWHCvYp0U
 U7WMp+S6fbcCQsjvUzIRvGihCk2wnelpSPybJxv9aPgPvJH/2Q9Bp4FCbLhymk1TJdLACVY
 tNke6VamALyDNd9theYf/QpwhLZShCQDhsO6KJzXj7Aihi1qKCJefHw1nU1/9YGR4Mh0VA4
 3t22eg/S+4Y5juXqsxN2w==
UI-OutboundReport: notjunk:1;M01:P0:H3ddCuVI+08=;FuKuZdqE+LyO/ovYd7kI/LBYHH7
 1BquZJV7yDnZAq3QrkDvghilD4FPiEtRngTsk3KCj/omyHEfMVhKkX3zjOI6ddAMMKvJtI77U
 v2nNOBon+Y5RKrDtdAKDwNPQpaNmnK8ZnxNzaNBDpkTrv2YLlzkH1YsNtlWAcFR0uy7nQ54c7
 g55gmNEf7mk+GO8GM+b/VZRxtOc/ln1BBa2BE3HMRPZh0dAnffyko2z0yYuH2i7VqK8ZT96zU
 97OeKp0acHRETcR/WuIHP4LWNeq+TqlPa58qYIzc6SpOrAXNpZUGF6/op3zXDQQwrdkcUYABO
 k1qPEuF455UBguUPoXaHmqwrlrrhLQgJfBphfAI/LhZwdNa1UTLafQEF7sCTt09j90rDpEwsc
 vxVb5aQwAOudnybxQaYkHYfkO9+r2iBm7NWmR+19l8uEHJvmBEGA1Ae2jSian+hfwKmsGFfS6
 An8akll0stTcaY3+aXRp36l5L8IgYHqpu43tlR7j6iNxZCl+4TLOmDEX8CyzSi6AwCc/hJhs/
 cIuefjktwSXY0gol2oRmCXTd4+JPpvFoPcfsVUM6xez6Oj+mmpQ2CrmdQHAUHTIi1pueS+7Xk
 3q4/RUqz26ieSi1k+khwxlaJt6sCIYdkXtOPD3BikHFQtWCetvIiU8R+oZa9QGYEvGWNz8a2R
 9v8Ds7T9O5D8//Vnsnt+XFBUzi9f20lvfBG3HDCvxVG+5bmuR4ruvL6lkHKFL6jHUJcHZXUuG
 j0ZN6ro3CkEghF7k9u1sjPWivH8BbyD9PgWXHFUEl7f+HaLB6FPW5F4ayuvpAns38oY6knOiB
 TRqKsdO5ojH//9XY5JYKHO3w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_050720_990688_466EED98 
X-CRM114-Status: UNSURE (   4.86  )
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
> +++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam.c
> @@ -0,0 +1,4168 @@
=E2=80=A6
> +void mtk_cam_dev_req_try_queue(struct mtk_cam_device *cam)
> +{
=E2=80=A6
> +	spin_lock(&cam->running_job_lock);
> +	job_count =3D cam->running_job_count;
> +	spin_unlock(&cam->running_job_lock);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock)(&cam->running_job_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.12-rc6/source/include/linux/spinlock.h=
#L559

Regards,
Markus

