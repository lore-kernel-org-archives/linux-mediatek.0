Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF55B606A33F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 18:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=irOL/t0j;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l14XjqE4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c752LIKH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hcIGtKJGIA7HEdXy4JiUyk2jk93QxytfweWjrnaJdwM=; b=irOL/t0jA/4Srw
	4RihFv8nOxnfabReCFW7L7AKj6rWo5EojgGpfdkZV6P1PkZkSZaiN0etJ3u9Ug4Het/+U+1uqsiRy
	ycD5QM2hFkdihst/LgsMQQcVfwvyVoHEzGomNqjmK8xYWUEPATaNiSqd4MK22QU9QSwGeJaRS+5hN
	sePFuyY0EvBl609cJtn+tYlEwbt5G5LHP0DZ6kWzPgy+6Z0ErrjjuInz8QBNgDxYOkMvSssLV90Xg
	dXb4tkyHxk5SGxJeqdnDm7S8/NNX2JD2Q0AvHjjlzwi6E54HBPnMvcbFWvdYymJUm52VBvWrBkkQP
	zKqpC6kUbqM15Rs8ElnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1kq-0000000A2x0-2GrD;
	Thu, 05 Nov 2026 18:00:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1km-0000000A2tX-3mXy
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Nov 2026 18:00:02 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeM58924152
	for <linux-mediatek@lists.infradead.org>; Thu, 5 Nov 2026 17:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hcIGtKJGIA7HEdXy4JiUyk2jk93QxytfweWjrnaJdwM=; b=l14XjqE4iAeaylTw
	udgrt5Fz/NBNSZujhmgBHfQbVeUdVAnfcdzy+5JxCYMrm8RwQiUY4dvtYrvyPFNE
	O+7HSqjZCGjLWJz0keLVrobm+Pig1cRLkWSZ494lXWuJ26XaPzR12dIdmaI3P3Qz
	/Sfuqnc2UoIs8f0s8NRrDvr7t6BEWqaLstla7bVvVVohMCxMa9bmEDKZbqSQTO6u
	Rk67HNB+/VS7G7eobiJHoZAEg32daNlxHV2zNnBOZRXrspsOLFr9ooaBn1snM9DV
	Lw/gFGIkrAB91na7p6PrgBoyMjY3yXD5RzOgm+aSxmZscf1phwp8jjMG6Yd1O9uc
	IEnxxg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkt3hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 17:59:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3662e7a9299so928090eec.1
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 09:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793901595; x=1794506395; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hcIGtKJGIA7HEdXy4JiUyk2jk93QxytfweWjrnaJdwM=;
        b=c752LIKHINTBxmOSyRLa/qJkwZNLXR48uJ8ftbIcoqUwUGwVlY4dtOsLjQFZc6I2Tn
         WFHGOmBNXLVFLMcmtFxKfHawRENwAAcnPtB3dnYf8hLNhYGuMz7SzSiAamrA2U5QI6U2
         kJ6OA1wYyD2nyFt7Cmw2qN2lICPv/rlBhIC59pX/WG9dj3JFI+G5r/aekHScP1riloHQ
         +X+r6E0T3DSKZQVZoP0oAwoQoiOhKRc0LrigySOiiZXklTlKiXEmB2Nxc1PTzKwadHeB
         lXhjFfU4qUSVWAnn7Ih3BssKN6XNKUEU94PraOMZwlCgZqvK3YDSTf3Fp6db38NbtXgv
         bg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901595; x=1794506395;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hcIGtKJGIA7HEdXy4JiUyk2jk93QxytfweWjrnaJdwM=;
        b=v95wtCE4WX1pwWIFxDA7t8WRDBhs2eo2ZKW889ZVVCFDrk+PDbheT9GUKbjgqXGA/T
         +PfWoArJDooZgnZx2K4+3VU3pFF0/uke1hApGs0NohT2kGpB8KM9f6Oi/QnDO3ednNsc
         44740UoMVBfw9F/7oe9Cvzq37TSXlSp6Mr+DBhyKx0NO32JWuGW336LKyupv9/24ANIS
         WQWMngYgrnxcxkTuWwMLvFJBNUf4QWGFmU28rOJogKhrtk4BVkLb0uPb+YdjW5dptkPl
         vzk0l4QKFesFydISOSTF3PyK2GKKHU4Dl6iAPrdNAdFLRTz1id8IRdPiqUEP/XOXp5v2
         iOxg==
X-Forwarded-Encrypted: i=1; AKwUvBwn7FSR1I/KDMQasD+HAU5nw+fS7XdSQEzsMR8/NJm+8XR9jQlZ9BtKPbFza2ruegIiw5w9ByAg7xK8B2wBOQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/C45M9/v0R5jyGJWPG0OoGCAiAcS+zAaeAWXYqjgM+8i0DKHWc
	7M5LnO5PDQbdfexeijfow3u8W/Ye+Rt3oPldzbxT0vJlm/nx/QhoNR8OJI4giuZ7p2zt2bKttG9
	+XfZDVyTxOiGQGY2lJRDkgvdEVD67MvzNdGyHQXIB87sX5D17Rw8Jk65b9ziRQUjiS7DJBRge/b
	w=
X-Gm-Gg: AYBFou1zWOZvUM6x93XPlRQFky9KOFxTxQ0pqDXbJHCufynW8en3JsKp33KqOBbAPt1
	yBPZKISZHuSOcjhvh1w3DeKQiYIJKAdt5r5oe9yJMX9NJXtWh40jfiHbfwplP7XTA4CVFgiQk7f
	PbP4B+XI9mDSq4N6bGkYLkp5nZGUKCN6o/0ck95Wn2h4oUoN3p5O+k8wyWeUSugjwe1x6AJ4NuB
	1WJdoGg2fHT8SaK3TY6AeX02EgYk6+CPop6BRWTB/g4e4RYFoNPvv/XXVhfKpSVM1LOtvkkLF3z
	Ma2Rh6yHNlRExoW/sHpSnUFyq95VZ8Mre8QKEYIi355hHKUAS/WNlRA26FX60IIJADdg3X751D0
	1rhiWguA8PoPgMaxnWL9usu1jdpjw9K7OrNy+FM7gdxegGjI9nUSwNY65wdxtOUg7LcnKyKfUI/
	AEAzrvw3uznYBr65nY8P/oM5PFIw==
X-Received: by 2002:a05:7301:619b:10b0:36a:1d6f:917c with SMTP id 5a478bee46e88-36a423c3380mr31476044eec.22.1793901595342;
        Thu, 05 Nov 2026 09:59:55 -0800 (PST)
X-Received: by 2002:a05:7301:619b:10b0:36a:1d6f:917c with SMTP id 5a478bee46e88-36a423c3380mr31476004eec.22.1793901594753;
        Thu, 05 Nov 2026 09:59:54 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fa273sm21151517eec.16.2026.11.05.09.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:59:54 -0800 (PST)
Date: Thu, 5 Nov 2026 09:59:48 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Borislav Petkov <bp@alien8.de>
Cc: "Santino Wang (=?utf-8?Q?=E7=8E=8B=E4=BF=8A=E5=82=91?=)"
 <Santino.Wang@mediatek.com>,
        "linux-edac@vger.kernel.org"
 <linux-edac@vger.kernel.org>,
        "Sidney Chang (=?utf-8?Q?=E5=BC=B5=E5=B1=A5?=
 =?utf-8?Q?=E5=B9=B3?=)" <Sidney.Chang@mediatek.com>,
        AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>,
        "Fred-WY Chen (
 =?utf-8?Q?=E9=99=B3=E5=A8=81=E5=AE=87?=)" <Fred-WY.Chen@mediatek.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Light Chen
 (=?utf-8?Q?=E9=99=B3=E6=98=B1=E5=85=89?=)" <Light.Chen@mediatek.com>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "tony.luck@intel.com"
 <tony.luck@intel.com>,
        "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
        "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Arnab
 Layek <Arnab.Layek@mediatek.com>
Subject: Re: [RFC PATCH 00/11] soc: mediatek: add a DRAM ECC error handling
 driver
Message-ID: <20261105095948.000013c0@oss.qualcomm.com>
In-Reply-To: <20261105045321.GAauwLwdk2PSruRAcw@fat_crate.local>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
	<20261102123642.000044cf@oss.qualcomm.com>
	<20261102124434.00007741@oss.qualcomm.com>
	<78ce4a6ef441cb9836466e9ae5e72ffe21a88242.camel@mediatek.com>
	<20261105045321.GAauwLwdk2PSruRAcw@fat_crate.local>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3MSBTYWx0ZWRfX10kkDsFpzMh4
 WFKnwHoej4A56nNeql84pCdPFXElcAr7MlJfqkBEs4DcZDqLrxKchyMRk1pqNJCuz5SpUwhwL4Q
 WnsWLJu7yS9XXHOOyDjQwAZyvSP/+wPJZ2Qu//O4SwRQ232hEcgcxBNf9bFjMAm08vRWHwamGh5
 bGZaPsa6hmn21W5ySGzukQPrYgr6wPR9gYzZDeQo4CboSJyz/WDTtb7nq9v0+0CiZuMkOTi3B9M
 BhKW6k8bl0nwEXtxF4keXqm87+s7bgIwNvCTH9C24WNFjtEmvhVheOUdIG6zBHyLkHZ/b8m/TW/
 CG/m/2ajlDJ8Lv7w9XoHI3pqhH8ZVKSu34c/uNWPaXFVgO/E9wHybimFnq1h1amfY+xpZ0vFEa5
 +v6vmxpzPvo8v6WPsgiF5Ob1Fbi+eAt9rngGIxY6FSYMCK1hfQtCYEo2DiP5UQcEWbwoG8DCw4+
 C7waJyAC9wEebk5NCKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3MSBTYWx0ZWRfX4pQWCqqq9Gtg
 IrElNYsHlPn2EkGgOjIg1k/Lqx0Lyu9wzO56g1ZAsJaf4dO2zxVOixEkxNHJ6boCaXF0zV5WnX3
 oBVitu1yorxPcXX94DQEeZOdFNFh9v4=
X-Proofpoint-ORIG-GUID: RByODiZLLYtd7ffP5ONdhBFn9g0XXKKn
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aecc41c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=xlvtQj9HLH9P9y80AtsA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: RByODiZLLYtd7ffP5ONdhBFn9g0XXKKn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_100001_102794_41A59B43 
X-CRM114-Status: GOOD (  20.66  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 4 Nov 2026 20:53:21 -0800
Borislav Petkov <bp@alien8.de> wrote:

> On Thu, Nov 05, 2026 at 04:19:27AM +0000, Santino Wang (=E7=8E=8B=E4=BF=
=8A=E5=82=91) wrote:
> > Which existing interfaces would you recommend for obtaining retirement
> > status from each memory owner? With that information available, can ite=
ms
> > 5=E2=80=937 be maintained in userspace, or would they require support f=
rom an MTK
> > driver? =20
>=20
> mm/memory-failure.c
>=20
> Look how the others use it.
>=20
> What you write above sounds like you need an EDAC driver which collects a=
nd
> reports errors. Look at examples in drivers/edac/ and there's some
> documentation in Documentation/edac/. Perhaps ask AI too.
>=20
> If the stuff you need is not there, you can extend the existing interface=
s by
> justifying the extensions properly.
>=20
> But what you have - a completely separate RAS implementation, homegrown
> somewhere else in the kernel doesn't fly. I'm actually wondering how you =
even
> managed to do this driver without *finding* all the RAS/EDAC glue we have=
 in
> the kernel. Googling for it would've told you that there's something...
>=20

I would add to this that if the standards don't work for you, consider chan=
ging
them.  These days it isn't that hard to get ACPI changed and they have a ni=
ce
code first path so discussion can take place on kernel mailing lists to ref=
ine
the idea before going to the standards org.

There is some overlap with things we will probably be proposing for ACPI in
the next few weeks. I'll make sure to +CC everyone in this thread on that
discussion.  Inputs form Mediatek (and ideally Borislav, Tony etc!)
should help refine that and avoid pitfalls that have made previous RAS ACPI
stuff less than ideal.

Jonathan

> HTH.
>=20


