Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B01C606A325
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2026 14:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3Jw8XWQ/;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yp5wOBuY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bfW8coeW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uAfz1CBg89gTTrNRgxCYtcGq77WiqvE+shO/P+3SRQk=; b=3Jw8XWQ/fuOoAg
	uOPlPd4dcdYFrl1mBW7ZkRXjtO1BWDvBaiUmAlFJX4Rglcsiqu1a8ObpFAh9CspCA0znZAzvDrCmP
	qly8e4S/2CLhsNiaG7hQZIMUycuQ/NrBsqoU16Ud69qnjjos7hxmsFg/6R86amxIvoVy0v+BbwzqU
	hv+/Gjzqf66pIEVmpAU2jJDoLNZbQeHL8/r58t2L2DUfzgitHX6khcsXNyCIbx9d53uNosTEEqYca
	/fYPac/rKGQyV0lCTCSTS98lFXMFdhl0pnJAEza39S2R5od+wjKJqnQTnJIXDJCXBi5MLHcvAT4k/
	tZ0lI8u+amEXdeRzw1Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMn9y-0000000BoDY-2eMJ;
	Fri, 30 Oct 2026 14:00:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMn9w-0000000BoBj-2z5s
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Oct 2026 14:00:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDn9n82511781
	for <linux-mediatek@lists.infradead.org>; Fri, 30 Oct 2026 14:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uAfz1CBg89gTTrNRgxCYtcGq77WiqvE+shO/P+3SRQk=; b=Yp5wOBuYUvaZ9G8H
	Y1Ge9H+4Uez+7kLRVDPNkz4UIdvmsydhiWxon7uANhBzMmnRD4gl4ktaeTi7mg1s
	e0O0BgJCK0RC5wjWI0qIafUgGDuhxHpYBQDi5Wq+ocDWDCGq6cVCNarTRp9nmrhL
	w/1K3hutLf4UKu83ZkdzgXoKWv1CPqy0/LBn2Dpm7ff5xpkl19H13Fn8+HXVwJQJ
	jonaNFWMxz/1aG0P98FMwkS8WWWzGZF5MkDntYotkgojATsIDlO08MftH9z5v6Ce
	l+D8tzVXSZfHpPU4HJ1K/LUz7NvfuyaefcFPpGSPbPHr6vXgV43GG/GFuf6ct9bZ
	GpjimA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pbc52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 30 Oct 2026 14:00:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9821ca96fso13036035ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Oct 2026 07:00:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793368844; cv=none;
        d=google.com; s=arc-20260327;
        b=r+HUfUTWYnRwEED6WJA9oVSiqGtALHc+AdXHSzLKvRWHJ68aoJ/MvuL+z0o7g7t38y
         Jts9sOwzGBKmK2EgtXg4JHjotij0IqOFTAXcvZWvFleBLBe14QLOm+9JEx7m2qhrglK4
         nFbkdJxFvZWlMtI+4q1/ri8r3e8sF280sFaS7Ix+0BYk0+yNrAlKOXER4VENul1IxvXn
         Fso/XYE6RvQWH9OT0IQ6ZzPhGxtpDGwbCGSjn6T6S816OPuNMQ5Pt7XKu1EVR7CSLLLD
         4rhSq9kcGBKAhOhKSSpeZNSFb06v8FpFyxfydn/+G8bDm+Rhy/orn+mt0j9mY4sj/NhT
         HK7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uAfz1CBg89gTTrNRgxCYtcGq77WiqvE+shO/P+3SRQk=;
        fh=dOL2dP4dKDRlgw9JOy3hehDlgrgTORZoMQFbYAzBemM=;
        b=Ii8LaF9YW7zRT/zgs2rHO/ywJ7pLj5nO6DJDUN9UoUcDzcpTekP/C4SI0Dw6VjGH7Y
         Ef2N82Wvr2++haxes5hP6uJhqLLT5hwyhmKxQmr1/JV8vNXshw7tQ0kBtHoSuZAor7nh
         wlzyBeTiPi2PO4QPgNWXcYL/s5slEYtYE55QEWCbisz5lu9gVpbIsKpZqQoA/CL0Imcn
         qI5dTFGbop+YPPqPLD1LMHfvc+kiSSVorQ3XJns8eQMgZg8C1LxkbAn0/49gW272pWB5
         uYqXylt8UQg2zhfLSKQtW7j748GeaUXmN5YjnOZEfHGYLjb+ymR2BhOS6gJLOXHk9BfW
         7NiA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368844; x=1793973644; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uAfz1CBg89gTTrNRgxCYtcGq77WiqvE+shO/P+3SRQk=;
        b=bfW8coeWz+fljX027iiC49Eg2FjlsMY9k3Krw9BwKPhER/FcPLge5BAp97otRQ25NZ
         cbfOba0g7gDwtSCHdgNEThzU/llPktinrKmCko4UwdUyoY6u1KzkFXKAdN0rDhITSfim
         DUjNrv710qUp2TfacRaOUK0iYE3NGimsW/joStWYbZ/9SwrR8EmWICDgxKeYccSv6l3k
         p3wdHQ2WWGdmCxqgC81YuPmlRCvkzIGeJnQ+NvfRP7sGqwJ7dU0OuMQncwpaeuEeW89+
         rPrU3lL0N+YUkhT8a3IaD3w+OViLHN8fxhc6s2onBe9rzylX4HupxbDfCPiPH9uUxNo2
         XUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368844; x=1793973644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uAfz1CBg89gTTrNRgxCYtcGq77WiqvE+shO/P+3SRQk=;
        b=JFfNsImliS0gj/wFfLoH09CwMMcGNf38BBX0PHh4j6Pcf+GGo+rAr5o5QEB9ai6C+g
         ircmLp55LF56REVBz5S+AJG2JUSH4sLKgFC1tam0Tgo/fMS1RS9jGDlHQ4I8UyQlAIsn
         efNAkljYNzhUWy+nhdVE177n6rkZ+0Bie7qcyZ+JAqJ4T+JmMJoJsQijYFqN5Aq908E5
         BEkPu6qM4R1ZnYNoMGdgcs/zqtCjQH2537t7uEBhUowxrmit7vG/2xEAAhRw6oGiWGWu
         D9vRIMLNStlkSCev3M2s7PYHyvhS6DiS5VOSZkxcl6zUm8/i5aBfLnRRT2y+xfm2jsA0
         lXNA==
X-Forwarded-Encrypted: i=1; AKwUvBziKdIw+sqca2iB7ag3SHmVjl2X8jJquxOqd2XBxVZvrmp8Q/bOC6Wl0WCUYRq8kZMgAPdXA+uL1TmfG42ufQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIawi3RpAF3HmcLODhjFU0xuJB/KuoftLb5Sql5exiWVBSi2rqO
	ClQFR3es9DjxijfhHGx4eYJ38U7DJjWsSnjCe4EFD9VMJe2QuuZYASvRY8qBw8pqQRFqszb7GNE
	pETgJ9WiRnfI5xJN3TRspX8V+l0M0bx0qSy9z6cXAk3m8H7/otRxbxg2dABt0WbX61U95zy2kqL
	VwgdM/lz6oYM5XpcOReQKg3RM5Ltb4xdBnUBu0esjw2t7HsU3H9Q==
X-Gm-Gg: AYBFou1mRiTLd4MbvcjV3XvhTc0EwmdT1XTZ0aOUzVm9fU+/GrGkyDs/pA7zGGv2EpU
	klCJyS6sUAMWpoVtFWSqCEIcav8zbxpx60dfkIli2D0ifCvKwA+sS1FWs4O+bwmrAF/2/+iCoGH
	AXpwG698lch+AEVasG7+ufV7Gct1xZrFaabdvwS4ecGPAkv6f9wMEs1SHKyw==
X-Received: by 2002:a17:902:fd8d:b0:2e8:7686:4d46 with SMTP id d9443c01a7336-2eb364552bemr27295785ad.34.1793368843558;
        Fri, 30 Oct 2026 07:00:43 -0700 (PDT)
X-Received: by 2002:a17:902:fd8d:b0:2e8:7686:4d46 with SMTP id
 d9443c01a7336-2eb364552bemr27295385ad.34.1793368843102; Fri, 30 Oct 2026
 07:00:43 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027144002.10606-1-ansuelsmth@gmail.com> <20261027144002.10606-2-ansuelsmth@gmail.com>
In-Reply-To: <20261027144002.10606-2-ansuelsmth@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:00:30 +0100
X-Gm-Features: AclHuK85D2yzjqjadIBbGwA5No_thmVDaWhvxFw1u5vv5w3KPYrH4xdvCoOE_dE
Message-ID: <CAPx+jO844b4kY9vbJPJj+N5H9cRJ4TzT52=1yU-Pi_oxqysd8A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mmc: mtk-sd: Add Airoha AN7581 MMC compatible
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX78CUKndAVHqy
 CG1drFjiLwm9CJYv/+atJEHyQWRsN05aMZfiiB/lPPbml8hfcDuF6hDopF19s9x9JQOB/FMi9Hd
 lePwJbQneozAYaNKNNtjOdyKaIdVQqctJGcX/yjM9NXf2dlDq60K4/wcPxpLOukHhrPLYWbFRLX
 ktNS28DUdwIh/aiVvcR4VEebFcfWtS+mALvrfmPX/jJ4k/I7v5GynJyr4a/jr6pTLBolxvAftyY
 GLojTsO6+WGOdnTstrYtQXOXmr4rgYue5OrAVr3zj/rwhbnJBXFVr//rZoJa0U5gdv2ikVUWtyz
 /SlpmLbHIWO+eZ6ykPEnpoLmjcy3X/lFQ/KzVa+9MEBbikSCr1aQI66qdDgVvddeAudmUgr5jrs
 v15xc5vK03z4JwEoA571utIoOt7e0J7SHTuUrXRzEIiFxzeeyhV09JNrrWZYTup7nvFsiV8QupZ
 fF6X/myxnEuS55JkELw==
X-Proofpoint-GUID: 7LAM78PCqsh7NRB-DWsjvC89VtGtr7P8
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae4a30c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8 a=5vCY4yJ5Sko5zDJxFQEA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 7LAM78PCqsh7NRB-DWsjvC89VtGtr7P8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfXyWOsvvfJU6qv
 Xcb1iamfKCulomHpLMtD6RMheTffjq9yc8ciXbfQjkCzlObRF8tgDT9PDj9B+0qSDP6tLLuvxOx
 xAKNwhg82zzPDx7er2UBrGDPQRIXewo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_070044_757702_A85C9A88 
X-CRM114-Status: GOOD (  18.67  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 3:40=E2=80=AFPM Christian Marangi <ansuelsmth@gmail=
.com> wrote:
>
> Add dedicated compatible for Airoha AN7581 SoC that implement a dedicated
> MMC controller based on MT7988 with the difference of having a single clo=
ck
> controlling it.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 5b160fdad3f0..736cff2783e2 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -713,6 +713,7 @@ static const struct mtk_mmc_compatible mt8196_compat =
=3D {
>  };
>
>  static const struct of_device_id msdc_of_ids[] =3D {
> +       { .compatible =3D "airoha,an7581-mmc", .data =3D &mt7986_compat},
>         { .compatible =3D "mediatek,mt2701-mmc", .data =3D &mt2701_compat=
},
>         { .compatible =3D "mediatek,mt2712-mmc", .data =3D &mt2712_compat=
},
>         { .compatible =3D "mediatek,mt6779-mmc", .data =3D &mt6779_compat=
},
> --
> 2.55.0
>

