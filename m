Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37F6C982D7
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Sep 2026 17:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqG9f5lzL9qDXlX9VaIV1TdU3erotb5WQ+seYvtPtig=; b=NLrKE2AUkEIu7dwlTvfO7mcSmU
	JqqPr4gBwzeBMhPkxtLMM14yJYXFm+LPVuU3jHv1Xcjo1oXJHwY2SRA1x6LdoOQ1U4WueeThgxN2N
	ceWDJwNK7NzPQasm2wLB1LFZGl82hjPPgDK74NHjtTlnNdDkgxGPq6wzie3sUkOttFSHof8kpEyfj
	MYzJVfOjU7sd8pVW0VProyjdOZdw641sW13ctoKISMSatcHVd03BXdAJJFZfzPG/BGz6MeNVhdG8e
	1lU4igU+mfkuG26YF+flzbIeGrMQgfLsiUiQtmh6iPZa5ZPjWVifdivq87S2oasLLPd2OElpTeNvY
	/ZzC/b9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7yvi-0000000GY5L-33J4;
	Sat, 19 Sep 2026 17:32:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7yvf-0000000GY4Z-3082
	for linux-mediatek@lists.infradead.org;
	Sat, 19 Sep 2026 17:32:49 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68JGLDDR230422
	for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 17:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HqG9f5lzL9qDXlX9VaIV1TdU
	3erotb5WQ+seYvtPtig=; b=M9pF5FaPKwl5mA156xYxOhScuVO02hmsmedapARv
	9+kklJNS86FnFMnCbQAtcLt8ZCMDy7PgqUvV4enyNqrH+0ZamayoeXkKRT4PtwQ/
	HFAlbVD0MEbyhMq1knPGp0VB5gEnhpDLt6lTL8lJXVhAzd4rA0geQtJcf1I8ehJ7
	3VgO787FpVQWqebNTDBCux9MkV6la1qPXRC4AsRrKSb0kCQaRZuq+TZ28UNIBsSZ
	3j+GkzqZQvPQsyOPz9IfcM5Vad/3DwQoP8DSdhI7FC72LS3xP82EzlUYhtkJdwRi
	H9HzxB7YD44wSAm0Jk1YskOeUWbOAV/u7DtDVBt0W+GbYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjfuhbsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 17:32:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939a6937513so267760685a.3
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 10:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789839165; x=1790443965; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HqG9f5lzL9qDXlX9VaIV1TdU3erotb5WQ+seYvtPtig=;
        b=XsCd7Qxy+o+dhL18KPD9ZNy+S5eLVkwHZnUcnEeWLVlJD3lP97apMIknexQCsK9cPW
         jERk8Adtw6NzvigXIIgdoOebglMOXSzKbOxSUfMz9UcZdpD3Oq4z6dF78b3ieRWxk7tM
         nppWO9QZH6tpcLyR7rn1M1TuzFIMFucc/qdsdgbowzNraD960jvjSTdWikMYE28r9t8X
         rThjru9/Cb7hxzHN10i7Cf3O8wdhqIZWIMks63YWAfv99UAiCQVUyYSWZglqP5BiG1Lt
         Zs1jZu4Pi4eeVsX10sC47XPQdo90RqXQvNdyOklHxlOB+KDGp0KkZ7xXX8/qugh6MUMK
         gx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789839165; x=1790443965;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqG9f5lzL9qDXlX9VaIV1TdU3erotb5WQ+seYvtPtig=;
        b=AM7/YLchD68ZIvjlngf1FURLHe9zU+O8gBRYx+nwrIuciRSdW3cj976yKLdi5KTHr6
         dOj3IJV0utyiAPDJE9XSZwv5rKusyuUXyt/oy8kTKJDxw25yEeRnOCVMHCm77qJF2mgr
         /FCmuuMOw/D3iKNF6YPW9AQA06SLf3mw0ateDQnuY/yHq+Hj2vOfWg9xcZIchp9n8l6y
         JhRj+/O9DTQnksn6wJHgoqTKkv8Aj0/w/qfs58aVYxVCfcrdRtvHfQXkyL7XecDC1aip
         XU6XdO33Cw0XkiWyj0hYuitCKyd+hZTsHtbpGWaH1gyyI3CMiB8OzpKN+gxeV9nn2SxY
         BovA==
X-Forwarded-Encrypted: i=1; AKwUvBzMvcCU4pvP1SW/+Chj9cF+6W3mwlFsxnI7rIEpgT6MNVaK/oGkNOAV7T726jhRHWU1HlJJujJHg9UcI+l/fg==@lists.infradead.org
X-Gm-Message-State: AFuF++mueGJdm0Vfx1DQJqNFCh20trynQ1xl/y/MmXxiUAmqNhI/kWoy
	roN1GZG/nAQ0YlSVacylTtogSxK5iM6Yh6xxVw4N1eBIYfj2+F2sDHOLsqLwfVefpj3gWs8YyfI
	ylcmvUkApd1dcHlv9IRvzjWSEzpCxW6x5UfmDw48O7iyRpQRPkqLcK0t5E4sQLuuafTs53pvAjR
	c=
X-Gm-Gg: AYBFou00A81xZ1xBT94zfWPyQytQZTPS8Urvbb0RK9TkMNtiGj7rkT3D9AxggXd5q7q
	DOk9d0P+biwfaUXXYJVUlRuaJ3O6WqsXDbOf2QQNnBCOYSQ5RjupLrBDSIkb/PWA3+XYXLBKNDy
	KViPnya7H8PO0W0KovKtC5OboCYAlF57zlOb8/hTf+gIFuBWjuwxFpvUfuZ7V6olzvjTzykhuUW
	jhqds+WOp/AG4rDNoA+2nqJrXE/7y6uldXTGf8NFWKZZfcE3qNYBmcCw7jvP5hq+uF9twU7yDn7
	ryZUrVrLuVCANxLoTtYeZQC90CsdtD5HzdUIPjyAldk3IibGrc/JopTxFnnoGvaGnWtVcfhm8dS
	6PpC3C+2ijxHWIw==
X-Received: by 2002:a05:620a:2697:b0:93b:da60:a557 with SMTP id af79cd13be357-93bf5595446mr265128085a.19.1789839164945;
        Sat, 19 Sep 2026 10:32:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2697:b0:93b:da60:a557 with SMTP id af79cd13be357-93bf5595446mr265123785a.19.1789839164435;
        Sat, 19 Sep 2026 10:32:44 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm330064325e9.4.2026.09.19.10.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 10:32:43 -0700 (PDT)
Date: Sat, 19 Sep 2026 19:32:42 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Tao <gongtao0607@gmail.com>
Cc: netdev@vger.kernel.org, "Chester A. Unal" <chester.a.unal@arinc9.com>,
        Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net 2/2] net: dsa: mt7530: trap frames to conduit in MFC
 on EN7581 and AN7583
Message-ID: <aq7HOswpuqqboFj5@lore-desk>
References: <20260919065214.31604-1-gongtao0607@gmail.com>
 <20260919065214.31604-3-gongtao0607@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hVJhV1FC9rC/pOle"
Content-Disposition: inline
In-Reply-To: <20260919065214.31604-3-gongtao0607@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDI1NSBTYWx0ZWRfX/tL2p+BrwbTI
 YKtWEu2IUeyGMd3uo42eJy5Or2/XY6JEry8PaJ71ukYfVaFDgZ4unG8ce6o7fV+ItoSEmhds68S
 NvnIxU+ZOxaA6OX/aRBK4eEN41pDm9A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDI1NSBTYWx0ZWRfX6Hd73zESFb1T
 Jl0M3DO3co/8tC6wF4UjI4c72OiIwtAgdvS3d3IPbFAkEqzxc4ih42niPhgwFDon+ILQjlhNsY4
 qujdD6gRBqONvE/VT61Nt5HpHZ8gpf3GCs308+AZPBxIpZWW9T9bukPWUqDWL+dapcf/5TtSW6b
 syq1AlE1ks+DbjfPuj6NXuOV2AXCMG0n5SfK9lB16Wjh0j7W353uXstELg+eMY7wcUqSMKr4S/r
 vePaKqBOIRTYMdGCuQjNrRwHbav7i+SIQpElGyCGk2j8Ax1U5SoDA3GvbYMFY4LoYva1OMfnh8Z
 k9g7gMOurjaSc8WfpmOjKhHjntJJSflVNdhQEMr57c9XnpwDyiPwzFC+ip7oFLt4fkoJVKDzNJK
 mGRhWXUJtg8sLvEUF5wM5G0c2g2tQalFvoZabKDidKvc4rpCPLKq0oknf/WL5YScFi91JUqwm35
 VvXPwGWGTHL/fXZ1MoA==
X-Proofpoint-ORIG-GUID: J-ssWV6DHmzDxaN4PimCAPV50iiSb6ZT
X-Proofpoint-GUID: J-ssWV6DHmzDxaN4PimCAPV50iiSb6ZT
X-Authority-Analysis: v=2.4 cv=QKv91QLL c=1 sm=1 tr=0 ts=6aaec73d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=heobWi1WCqv2MVib:21 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=3Szyxn8DIQ0cRF5uja8A:9 a=CjuIK1q_8ugA:10
 a=oxjvUbtD-TdPno90v-gA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609190255
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_103247_874944_A47B604D 
X-CRM114-Status: GOOD (  23.28  )
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

--hVJhV1FC9rC/pOle
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On MT7531 and MT7988 switches, trapped frames forwarding is directed to
> CPU ports specified in the MT7531_CFC (0x04) CPU_PMAP bitmap. When support
> for EN7581 was introduced, it was assumed to follow the MT7531 model.
>=20
> However, on Airoha EN7581 and AN7583 switch IP, setting MT7531_CFC alone
> is not sufficient for trapped control frames (such as STP BPDUs) to exit
> towards the CPU port. The switch forwarding hardware also requires the
> MT7530_CPU_EN bit and MT7530_CPU_PORT field to be enabled in MT753X_MFC
> (0x10). Without this, trapped frames are dropped by the switch forwarding
> logic and never reach the CPU conduit.
>=20
> Include ID_EN7581 and ID_AN7583 in mt753x_conduit_state_change() to set
> MT7530_CPU_EN and MT7530_CPU_PORT in MT753X_MFC when the conduit becomes
> operational, matching the handling for MT7530, MT7621, and EN7528.
>=20
> Fixes: 2b0229f67932 ("net: dsa: mt7530: Add EN7581 support")
> Signed-off-by: Tao <gongtao0607@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/dsa/mt7530.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 863f2079833f..9693a55f553e 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -3309,7 +3309,8 @@ mt753x_conduit_state_change(struct dsa_switch *ds,
>  	 * interface is up.
>  	 */
>  	if (priv->id !=3D ID_MT7530 && priv->id !=3D ID_MT7621 &&
> -	    priv->id !=3D ID_EN7528)
> +	    priv->id !=3D ID_EN7528 &&
> +	    priv->id !=3D ID_EN7581 && priv->id !=3D ID_AN7583)
>  		return;
> =20
>  	mask =3D BIT(cpu_dp->index);
> --=20
> 2.55.0
>=20
>=20

--hVJhV1FC9rC/pOle
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaq7HOgAKCRA6cBh0uS2t
rBiNAQCFg1nQRwOzz8FU5MVSG9sMaa5p0AdbjtEe35Uz9/PYcwD/T8H/q4YIYf8V
geEV0Ie0ekM6b4TJpIqUUS/qyK9/LQM=
=JURm
-----END PGP SIGNATURE-----

--hVJhV1FC9rC/pOle--

