Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4DFC982F1
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2026 08:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoG1axqiW7GSzo7JL49Rru+X2FH8bH4THAcHQLUbhIM=; b=vvL1pie/huAoyMdm2qfB6B6liK
	a/LHcCAOrvXzXlPzbPhfDiye4u/ugNUahiRnko3LO8VxqN+SpW1uMGTp8pbwkHLJ8d8aAkyO7kkMD
	abutGazjbl/QJJ9K0u9rrQQZfimVfgKZU5uagrWwMSjjD/0XNFMB2ysv67ZENMcKoEPnXkVy58E28
	hBz74FSJl+wqOBivBc/1gkCia40frzns0OL6l3uHihYwZpqPitD75d5jMrw8KhcYzXmJQXdXlrBni
	rBdQrbz5btud75clQpespI2E0UfLTo5y8h/8KLIQl90Nc95++i+F3ZyNvqJJFbG2qTz7teV3d9kIl
	K1fvWrtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vfT-00000004dgM-3MRx;
	Tue, 22 Sep 2026 08:15:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vfS-00000004dfW-0LzB
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Sep 2026 08:15:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M75B7U1978627
	for <linux-mediatek@lists.infradead.org>; Tue, 22 Sep 2026 08:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GoG1axqiW7GSzo7JL49Rru+X
	2FH8bH4THAcHQLUbhIM=; b=TPMh2/ufSQdrKpQI7CtbbyaqenspdgjbOubvvNwH
	nipujmpyFSmceek5gA5NnO594tYTTx5p2eurAErDO+V091J7llTtp6neHQKQyLLG
	/HJ9bl4YUyfaur7FJMJ/50m4C14B0z80NzJ4+Mss9LvSyQv8X6wqTjhSbULOVhJb
	CHSngyP3pZbRj3VNesFN+Sfp1Ub10kXTRJQbiFZGhWQvMdxXrf0CBw4eMPZTHTGD
	SZAg/cO99LRurcCfhnenHVKbO0KCf62/MRLYvR0LQPgtHAy2H+CrHZ+B5ijqKJqh
	wRU2dgcy7mYhaxfBmrlkEU+hdeMfjtUPr920fZe7t2j+DQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0htkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 22 Sep 2026 08:15:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9393ac4961fso520501185a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Sep 2026 01:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790064956; x=1790669756; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GoG1axqiW7GSzo7JL49Rru+X2FH8bH4THAcHQLUbhIM=;
        b=RqvBBmjJRRQsxVQayxPD+ha5HJZ5bwQ7e8Ih6shOI76FO8ReQTWQbgN0a9i48syAyO
         O0MVhuoF+DizSkiNpKVwK0e0Con/w8tuggmlAJfyommP3bDc4KfOW55OrzAHHvHqRuvH
         Iu1UpU6NDztu7NMZZn8vx/8uZySDygNCTEPn9XczmbHZ2mu4qb+KSSSYylNkVaem4Yv8
         rJPVntjkEVjApwJP6a27mRRhUiBs4uFYiybUsUJhLy7otCpnlDoNaayVOq+VYM5dm9Wg
         d5Mi9zT5CKLb4LbdiLJDA6tebA4/oupShPvxohXTP/8bAWjsYt9svsICMzw9HD+THx6s
         CU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064956; x=1790669756;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GoG1axqiW7GSzo7JL49Rru+X2FH8bH4THAcHQLUbhIM=;
        b=MCRWkzRV/cAXYRiCR5iF3Ydw/l1m/ziopsoVZwLZsY9IV+tgqlLxg55Irvdh7ZpObd
         fXUED10n/VSgHhsJVdV2JQcqnZ18ndeflGZhsW6KLJcj2495Hd34QxGQ4tPm0l1xu9ye
         6PTbHRhpCNcIgc7Msl5u8my6pYCO3SkW1gkOXUQUhiYYLIyy9g2d03LSgb2Kp5jg2j7s
         BNYIrjjQLGdwWpqivORtdaN6/soHCOB94UNudHhC8lPpQaD3kNhtdg8sGtxsiThIGGPM
         RCq6Mbh1KQ97oMCRisXe8u0UGy4dB8isS2fqqvWNR91gHfhViXPlfHLYuYbbKZinu9Oi
         ISqw==
X-Forwarded-Encrypted: i=1; AKwUvBw3l2EWjr+FvjLW+vamyKFlAGLeeJfTYugIGeqeJroInzn7nZTO/ChvJDrVoCyMbnpggaVk09+NPFSzcjF4Hg==@lists.infradead.org
X-Gm-Message-State: AFuF++mbHpDsXMkXAIu90dvjtWxwiaVvSOXbdjDXbyaBSAOhMV+KwZWe
	qTNKH8ysqjH2WKpqXpi65r8SHnC5eLIuQAajTJA0RVqufV7cUXsXjDnY0gb296BG/7hz8KPGDl+
	fFIStz9nIBhFIKDJuQ5pkfcoBD2bFBMjrUILisbML12l1xL/lcF//a4vZ+Oy/XbY6dbYp5/dD6L
	U=
X-Gm-Gg: AYBFou2ePV5jngF2V+uE+GBtFu1H8R9kHcqaBBszOZinrTs4CkMMJfLMS1d2plxeUAp
	8n3G0xG3DfsV6rSS2WYpKtBRmSP9tMyzBxw71O+fWHA9Y1G9ejo0I6DReVZpdXegzShd70ER23T
	dz7oeDx4u6smf0bRxnDdtZYzvLMXByLxPasgWIG0jc+UnMyMa1Lx7s+kUZ46kFjU9t/SWD9FS8L
	RUzqNaV6VKOq6vV9TOOZyrkOsmS/vlfTRL5wsNQhcNtdoV1OFsG9AmjWzkxOcuHF3LhNTMwTMfg
	LUXzwobUGAdj6o3e0G6PnKZAvly++at9OkOALGTEbRwnGo1xI68Vrz5oNmOz3+t726NY6mpxFGu
	LqNtbUcBtLp3p1Q==
X-Received: by 2002:a05:620a:838d:b0:93b:d7a2:dd39 with SMTP id af79cd13be357-93c15ed080cmr404179085a.73.1790064955579;
        Tue, 22 Sep 2026 01:15:55 -0700 (PDT)
X-Received: by 2002:a05:620a:838d:b0:93b:d7a2:dd39 with SMTP id af79cd13be357-93c15ed080cmr404175985a.73.1790064955001;
        Tue, 22 Sep 2026 01:15:55 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5e7850sm45992066b.42.2026.09.22.01.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:15:53 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:15:52 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH net] net: airoha: npu: cancel wdt_work after releasing
 the WDT IRQ
Message-ID: <arI5OD8X2Eoz_Ojd@lore-desk>
References: <20260922000914.542068-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T9inMwS7qgqrO+Sd"
Content-Disposition: inline
In-Reply-To: <20260922000914.542068-1-mhun512@gmail.com>
X-Proofpoint-ORIG-GUID: hBksUN4oTUMIV5XU6tZSKDRT7r8GXRJm
X-Proofpoint-GUID: hBksUN4oTUMIV5XU6tZSKDRT7r8GXRJm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExOCBTYWx0ZWRfX8jSVsAW7nIBz
 4lGqVwunnTwgiXZbcHVwFfaiEo4ueJy5hZxi0FwjxkKEFmeFWlxjawHTPeZ6WlWX2biEtWlLqG8
 iP4dAX5H18i453KBdAFCs4JnnUpvo0DaNWjwmUQ9QaOVGWqqKInKAazF7c5mXhs+d+Gi3xOYkGm
 LBqRLF9yy2Di7F7JlwFEnk3CkIuFGqssVFijTHCpWzxeSHcHLZYD8Ml/a7pMVm7ZJ2gpHmBhK0c
 FDSnU7EUPvsNrZu7STHyLB4meigjYGzQKPFkMgjDwkKEayXyXLoZpuCziaQwcRvXAbW0X5n9jYX
 xNp6IAPlOX8jNadaMtfKKd3J3x3nfIGVJMxuSgME8DE7FTenNLW58t7tnuogpBd8pL31vX0kS6+
 QKUYH8WePxe0NJoBiQ5qMUC2ThWZ2hTWYurDMn/L8sq1bIQcQWF2ai+0vGBJtdZ8Y2ctyKERTOz
 50Y+Y57SiLIAeeNcPyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExOCBTYWx0ZWRfX0bmVxvq4DikW
 TgnIxeZK2NhOYciTG3N7gz0r10yqhxo9K4iYo8UjrdVmUuUvBtmrGgxMwQlNCQ+/N2zZgEXaUo3
 8SGpfCSScsyvJIfBBNUEYdVq5RvQQuI=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab2393c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=4MF4sh17vRPpCNt1FVoA:9 a=CjuIK1q_8ugA:10
 a=TFMy8jt120Iq-BnFKmgA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_011558_128939_A9FF80EE 
X-CRM114-Status: GOOD (  28.03  )
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

--T9inMwS7qgqrO+Sd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> airoha_npu_remove() calls cancel_work_sync() on each core's wdt_work,
> but the watchdog IRQ that queues it is requested with devm_request_irq()
> and is freed only after .remove() returns.  airoha_npu_wdt_handler() can
> therefore schedule_work() again once the cancel has returned.  struct
> airoha_npu, which contains the work, is devm_kzalloc()'d and is freed in
> that same unwind, so the late work dereferences freed memory.
>=20
> Register the work with devm_work_autocancel() before devm_request_irq()
> and drop .remove().  Devres runs in reverse order, so the IRQ is freed
> before cancel_work_sync(), including when probe fails.  A cancel left in
> .remove() cannot get that order.  Initializing the work first also stops
> a pending watchdog interrupt from queuing an uninitialized work item.
> Probe currently calls INIT_WORK() only after devm_request_irq().
>=20
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code.
>=20
> Fixes: 23290c7bc190 ("net: airoha: Introduce Airoha NPU support")
> Cc: stable@vger.kernel.org # 6.15+
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

I guess this is net-next material, it is just an optimization, not a real f=
ix.
Anyway:

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/airoha/airoha_npu.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ether=
net/airoha/airoha_npu.c
> index 5bb4817a898d..4d3195eb00f7 100644
> --- a/drivers/net/ethernet/airoha/airoha_npu.c
> +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> @@ -5,6 +5,7 @@
>   */
> =20
>  #include <linux/devcoredump.h>
> +#include <linux/devm-helpers.h>
>  #include <linux/firmware.h>
>  #include <linux/platform_device.h>
>  #include <linux/of_net.h>
> @@ -751,12 +752,15 @@ static int airoha_npu_probe(struct platform_device =
*pdev)
>  		if (irq < 0)
>  			return irq;
> =20
> +		err =3D devm_work_autocancel(dev, &core->wdt_work,
> +					   airoha_npu_wdt_work);
> +		if (err)
> +			return err;
> +
>  		err =3D devm_request_irq(dev, irq, airoha_npu_wdt_handler,
>  				       IRQF_SHARED, "airoha-npu-wdt", core);
>  		if (err)
>  			return err;
> -
> -		INIT_WORK(&core->wdt_work, airoha_npu_wdt_work);
>  	}
> =20
>  	/* wlan IRQ lines */
> @@ -803,18 +807,8 @@ static int airoha_npu_probe(struct platform_device *=
pdev)
>  	return 0;
>  }
> =20
> -static void airoha_npu_remove(struct platform_device *pdev)
> -{
> -	struct airoha_npu *npu =3D platform_get_drvdata(pdev);
> -	int i;
> -
> -	for (i =3D 0; i < ARRAY_SIZE(npu->cores); i++)
> -		cancel_work_sync(&npu->cores[i].wdt_work);
> -}
> -
>  static struct platform_driver airoha_npu_driver =3D {
>  	.probe =3D airoha_npu_probe,
> -	.remove =3D airoha_npu_remove,
>  	.driver =3D {
>  		.name =3D "airoha-npu",
>  		.of_match_table =3D of_airoha_npu_match,
>=20
> base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
> --=20
> 2.53.0
>=20

--T9inMwS7qgqrO+Sd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarI5OAAKCRA6cBh0uS2t
rI4fAP98jcpyP9Tldx0CU7Z1EVA2UQeRcOvya5TXQ8iPwJToBwD/c4p6RNL7m3/J
s/bHKE3R7bhNQpjQhHDpmb8HLe2IXAQ=
=zZw8
-----END PGP SIGNATURE-----

--T9inMwS7qgqrO+Sd--

