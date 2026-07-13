Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB939C43458
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2026 00:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0bmxuDEd3/J3xqv1cuE3jF8wxqe+yrO2LZe9w8bDHc=; b=qt1Tyd2yZjVrGOXCq5d26fPs6l
	CYWVw4990NtoaRZxfvHFP3QteWWWzOqkqlKCPw25P3DeWTQXUfuKfu7CqJIpP2SZHavTuy3YtgAPp
	TRHVaWNp3vdsUf5QQPaMKE9YoiyeVZdDj9R/4qrBklKdRTs8Rq6IIr1dLRHhXK3W3+kRl83ur5NQ4
	iEioD3Kk54LIXfynGci30YHOTffKg5Ridd+gW97OtijGwj3gwz4RWSyY+FZTHQGxrM/w9DjVsX+aX
	FBiULHHlvpdrCMR8z9trUsVn25C1r0bTI0PXyx+ferPI0e2CDQM5Xsd94UKE+gcigcwb8h/XCA3cA
	RVarvc7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj4br-00000007sTH-3TJx;
	Mon, 13 Jul 2026 00:33:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj4bo-00000007sSX-45vX
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Jul 2026 00:33:21 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CNVKGh3945220
	for <linux-mediatek@lists.infradead.org>; Mon, 13 Jul 2026 00:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T0bmxuDEd3/J3xqv1cuE3jF8wxqe+yrO2LZe9w8bDHc=; b=dj1IS0N9fiDEisEN
	2opjupITBFEunYno/r9d/iMg3afIGD8xWRGxrw2B/xv+tECiOqit/zfXiWyUK8+Q
	uku98X7Sf1zsBcN9v27BQ+x9WD27fvzRzn5ELuJYP/f6r2u0KHXIwZf19Hd6/q1i
	rikYzHTq59UUQFfrIRqWGzyDIsFzRfCsT83v1uzZ+WILWLuZMbWRT/e7IA7cD6ne
	TqD5gcN91jsOYPT3bAVmp99VYvOYCTx+btV3JXMV8F7k4ST3TfabUlIC8w4GRchR
	dOtKeMj5PGeKer77a7I0ilSIGQUsI1wQHqeWuToF498yF5vm1csXlxalYic0ncIL
	flTB8Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr3prs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 13 Jul 2026 00:33:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3810960140eso2316443a91.2
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Jul 2026 17:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783902799; x=1784507599; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T0bmxuDEd3/J3xqv1cuE3jF8wxqe+yrO2LZe9w8bDHc=;
        b=IJTh8/IOnM+5uH5S3dGTGLUOQm5CzPkg5zA02roGf70RMExg2KoZ3eEd0wvPhE5mwV
         oUKoObPHcmzbqrt0KnhPm2kW/pGPMVAZ15SdlBxq1l/Ljp1w1ZVpHhKJefQOOxTbcw/g
         CYK0baGiqLTVMCdhFzmsaOXu8DfAk4TqPS1tkOTFzkGBJHQVBq+vizqr9EpUJGcnphh0
         YEaYGN0ChOHLGF6P8zYIUmy6H5Ns8gKPWqyeMBG9dcriABVcSRwjBXtE72lU/6H+2VHo
         hrPi32QTV1/atAKqsahEGpPkzQo2L739ts4LIoSwXLwE/FbvARZS26iF+YBOh94eJ8Tn
         Ifog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783902799; x=1784507599;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0bmxuDEd3/J3xqv1cuE3jF8wxqe+yrO2LZe9w8bDHc=;
        b=DU6bjtyGi7NxZCaSPTZCe7pf613DmkoVq+V3KVxc5S0EfNuHnSdUbYNQLxGTnefIxI
         56cbxxW4h2r7CC4D5mUQh4jzNwTRvEGBV+LN+2wXH00Pg6XGSpULRvnd7oKDYzlpw5Px
         u44UcjbXqrXTlCBSd3RAXz4rD3jDZ3MPi107wI6sZv8ClashQyZgtInynyGNio9N1b+W
         tBWXLxhro/RELIPW6MOLZq4yJoWzjA2iPokl3cayqLYkPAJ1OVbFSseKSP4KJ2Gpqwcg
         wm0mpfCSHqdijEe4y7X6lL/f9SiZ6LyZX31Kh3VXbNnNYjXKE9BX2G0iQTVYNgFrW4zf
         JY5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqkl6jlF3UZXW5Z4jCVdfginSmbOX58TaBzbnqBmGw34dF9hKiILwSUWF+1aW77blIzae55IVFx6DCgeHaanw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSD/du5JbUcqxSr0ipq8M8hpItpzwLbJ+P8NS135ny9EEGqDo+
	1KIKr0UEa/Zh2nHOBasf0SNzzET6QqdRR6vOrugm6QMfJ+miJn9F2AoDKwcAYLkJKJEHBBnusBe
	bM+Rl0usMdzJe71YOxnQPYQ9jwx+wGtNjsCAEff/nb8FZMN8mqySFaXAasbsdHiprrHbhFU+Php
	o=
X-Gm-Gg: AfdE7cn78JGmVGOl4OhgLDP/47HugvlkgiUL2EbN1US/6GL7ajBZ5q/nT9dsK3TFDj4
	P7vqtIn/tx8IzVWpkMCuOJJm+YAPSebIirm2eX9LlRG/Po3t0AuI+XNuR2+Pe+ZFfN79CmPScY+
	G8UaYnA7h8ggG3BwqiD7M/WJ9gVzGp2SpMsxLmT98VPqT1kj42RSnGhdHfBFs2aDTa+SMSvfV1l
	FVa4yS9pYPkE/M3K00G0DotNC36MGbpmEczf0sEMPMKO0/9PuCmkEKzLedV1wz0yHUFqB0MXnER
	I0jgdfb4hcel5g5USZMEb0Kb3urvq3zsI+28duCbQtolBmFELAvMhqJ2QwCAV2SMeS3XncAVhcA
	md/j2Q5ggiBpxz/GO7Ol/UgIuM9E=
X-Received: by 2002:a17:90b:562e:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-38dc761ab25mr7330250a91.6.1783902798692;
        Sun, 12 Jul 2026 17:33:18 -0700 (PDT)
X-Received: by 2002:a17:90b:562e:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-38dc761ab25mr7330218a91.6.1783902798263;
        Sun, 12 Jul 2026 17:33:18 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a583a22f8sm5493983a91.15.2026.07.12.17.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 17:33:17 -0700 (PDT)
Date: Mon, 13 Jul 2026 01:33:11 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Cc: rva333@protonmail.com, David Lechner <dlechner@baylibre.com>,
        Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] iio: adc: mt6323: remove unused header
Message-ID: <20260713013311.1dbea6ef@jic23-huawei>
In-Reply-To: <alQRYcO5grXoEk39@monoceros>
References: <20260712-mt6323-adc-rm-header-v1-1-d96395d1a323@protonmail.com>
	<alQRYcO5grXoEk39@monoceros>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDAwNCBTYWx0ZWRfX8RaVwCGoitoD
 P8eURj1ay1KXjbB63ES455oCUGvk0dTKM+Huyo9RcP3xPtkxsKTDNheZIYM0O6ZGxCOEjB0Pxa+
 md5GzsVQZwuC5Qx/kMocecG3DtTEv0Y=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a54324f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=IpJZQVW2AAAA:8 a=sfOm8-O8AAAA:8 a=4veh8QkxCU5BpHafbtMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=IawgGOuG5U0WyFbmm1f5:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: msX2CQFmoSA0QN98jdoGnawDFYpb7zjC
X-Proofpoint-ORIG-GUID: msX2CQFmoSA0QN98jdoGnawDFYpb7zjC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDAwNCBTYWx0ZWRfX3LmvshHj1H6O
 WKzNl3aBdP2xtip+1ouf9E06VY9x4rDfhhU872ShJSWBOnVUMv+iIjicjZsXFVCikIyPH6I8V+G
 pprnfr4IozbBWaGuY5flXAfMlTDgmJ2ZuTzxS4QU2rKy51RDZX5TZQKxwDNhql4SI8B2T/YURkn
 CYYPVtl5r2Q0aqiswa2V3ZtcpdD9lxiyf96GDCqUeMuaZeKSXF8QK0tqOOP2Gc5RGXRv1Wt/Cpt
 ihuaZMXjV21EM4Tnxp6kzYF38miO22NzeYpP1tJ+9WwFnlyA3gJ5+JU+lMsVIzyv2+vifESJ5Jk
 jiEr9wpenFaMCZsDqbDPGcQgw69V2ARq4nW7gn5XyAemYJkBmwqqxm2dqIH6LtCPwJpLqwgCoTD
 rn5C0J+QoUSI2Aw0H8zFG5j+g5utSacWuAwJtUjvYG221Tihd7T0hY9sZJSDrdJ9u64EFGrvdKl
 KycO5lljleFjP0OPIbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_08,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1011 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_173321_011184_97A03D69 
X-CRM114-Status: GOOD (  16.50  )
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

On Mon, 13 Jul 2026 00:14:45 +0200
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> wrote:

> On Sun, Jul 12, 2026 at 09:26:36AM +0300, Roman Vivchar via B4 Relay wrot=
e:
> > From: Roman Vivchar <rva333@protonmail.com>
> >=20
> > Remove unused mod_devicetable.h header.
> >=20
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> > ---
> > A small cleanup for mt6323 auxadc driver.
> >=20
> > This patch is based on top of iio/togreg branch. =20
>=20
> The only device-id struct used in this driver is of_device_id and this
> is ensured to be available by (e.g.) <linux/platform_device.h>. So:
>=20
> Acked-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylib=
re.com>
>=20
> Thanks for supporting the effort to get rid of that header,
> Uwe
Applied to the testing branch of iio.git

Thanks,

Jonathan



