Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18313C83F0A
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jul 2025 21:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2uc92O1GGv7emWG1TYEn9fypVsBaY5TnEeVaY/0T7/w=; b=bndFa1Z2XfIu4uuAIWoWGUIk2U
	pqys8FtCh+8uz3uqEwu6MbmZPOx6AwI7GgPrloKof6fOUx/cVQRj1TiE5zJ3KpnB99PD74i9G2PLk
	SgrDwTOkO+Main1jG/VQoWqFz41elN/Ks235d+KyHDlJo3C/lBEflGyp0Soq7zKNkr8vQErbIrvcX
	pE28OGLIh+VuP1jjREl/RAGdk+IPo3UWJi5WbefuNg6aZ7Go+7fSe/kGRfvc3KyeOVf0R7sN+Xv8T
	Ua1u3cdAlNrsj9F3g2jH9edIzg1WRgOEOG41HXQXlgFT9CpUBDutEieG/OXxE2ywMTob3oQu1Ixyp
	ivPX7GNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcoU-00000009xxy-46MF;
	Wed, 09 Jul 2025 21:58:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZZ8r-00000009VEI-2ay8
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Jul 2025 18:03:38 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569CosrY016276
	for <linux-mediatek@lists.infradead.org>; Wed, 9 Jul 2025 18:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2uc92O1GGv7emWG1TYEn9fypVsBaY5TnEeVaY/0T7/w=; b=KnupimiL4EZalts1
	9iEjxmVspLViNkxnTUsyCodjfZClzaw3RAAZ2hh6QRgRGnyn1GoKdQZidsvNJHYN
	Z7/VxAuaKpUtt74ZD+sV0H64fNlFc5S0Yd/FPiazPMl/e0V7hoqjbc5cJLu2kySp
	7XUXkBuvInznLXZjQPSYeQDgGitwILYrSCJRWt//urOBqwyfdi8imRlHHWnrtTBo
	MeSHWjhAulRW7flXAk5sA6yGYoCPCxRjjtv0S25CDHWIJ6+uRWzW4mTr47k5zDpu
	9GsTKJHcr+xuVJte38F/oNEiHARwn1Tmmpzc1opgSA8fRa0kksABdaEGanDNpou6
	KHMHmg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvefngpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 09 Jul 2025 18:03:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d097083cc3so2760785a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Jul 2025 11:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752084215; x=1752689015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2uc92O1GGv7emWG1TYEn9fypVsBaY5TnEeVaY/0T7/w=;
        b=CC2kQ02TkuXj6lrebvDD+Bp/an8xCk9Cbes7T25mH8yw3QtGcv4D61AsrMiK6Pktxb
         mpDK+LWWHEa2ACOL57+2SAvmKgnR2NK2R0sG7g2SjK3Pa7KpM/tfXQLxJCEBKHGgcgmm
         s6fm8O6jh754TPcBRuA7ZvElZthwKTRS1CVllzt/A/nb20J+N/A2IzGwIta9WBWbV5H2
         rTgFYlnLZNr2F9hD/Qk21fDyC9CFJrpm08vZEKzFBVSFC3CaSJDyCnhTlln224zVFfjQ
         zfOnTfOSh3Xn9skaEZ0LisXEBSedpdl6PuV43WD/kESuRissKvH1VMgUTM/YG4SQJVmF
         nk/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHK2C5pOa4Uhdf3Ep/+yYJqH9xfiD+9U69ujxnAkpxl/txKeI8vuXHn9WJZfV4s8Fyl0V8Eojhhsc67Qt7KQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvRyvQHeyoDd9e32zvhYzZUzUh0+VOArjao4f7XfSwm1gi4++f
	wwqUaezTpVV3tvCosCO4Kb5pZadEYDajAqoks0q2aYTnGDst0xtkTZLP3+00Dc3ys7G5dmksCPm
	fxrFojNh2Or2BNe2cMHBM4/1NJZq8sxIgRO7C9G5L6eVnBfo/hAxKrGGlMjw8UYna5j2vIe5Rsw
	4=
X-Gm-Gg: ASbGncvLi+uMc5UX1Qcs1AUUr9tY786Zh42st8ESzZX19AApN+lSXAbzkc+PuCwp1eu
	GsJaq+YtcdtvkkX9Zd0IiV+4xMZrGHrXbceV5mvsdKZe3+QsZTyhId2QwCc3s5dwTbFE2uFAZA8
	wEPTRPKtDZYkduEMoNeM/9S19TjQeT9KSPnqwpp9RmkJGbDAb8qetetJepSboLniFOZA/SJ7qK+
	lskL4Mbs5DIe0X3OSgUBDg948TsF9wVvR0WNM2YWIdXwnQ9xSJXFdWs9iTG3gYPlcfAAYdlH5e8
	gnRWWanaIvxp7+SE8jWsLTI24F9d1RB+ig2xAGsvZRBd2MRR9VP4PKe+629WAo7QS/o7y4t7Ign
	iMyg=
X-Received: by 2002:a05:622a:1491:b0:48a:80e5:72be with SMTP id d75a77b69052e-4a9e9db4837mr1964141cf.2.1752084214607;
        Wed, 09 Jul 2025 11:03:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT4JbzQDFlByDuD7hy/m9S00Zb2j1K9B+NMiIKO0svgqjP5RylRzZ8vUZfB5MYmmWt5DXtBg==
X-Received: by 2002:a05:622a:1491:b0:48a:80e5:72be with SMTP id d75a77b69052e-4a9e9db4837mr1963781cf.2.1752084214116;
        Wed, 09 Jul 2025 11:03:34 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb8c80c4sm8994918a12.75.2025.07.09.11.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 11:03:33 -0700 (PDT)
Message-ID: <68dfc6b7-1083-44dc-bdaf-4fc09e944671@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 20:03:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] pinctrl: qcom: mark the `gpio` and `egpio` pins
 function as non-strict functions
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-11-b6135149c0d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-11-b6135149c0d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE2MyBTYWx0ZWRfXynb9bQ+2fWNa
 ZIGAX/2geEaiOgh6Ca6r1aVR4oLk7HYgQwibGMXLz5WjwZPmgCviNbrGEgemv5k2HdAlQ//BfUF
 J4re7UqWwIpt1VgMEaJP+1kmt5UW4pVI6TU4U6gjnFLeJe7l5vErKuXtMKn+q2W78eZryIbP9I9
 8y97C+L8uEXemJZjxN23ahj6gm9tO0bSlT7ylGNPWne/OHf5uEydzko7DE8+9eyusupEryiLaGu
 SebjdK7gDpTtvV5Wcle1OjyzK3HntBh2MFOZXtvAowPcYlY97Zm7FI9ox776oTwrZM5c9i6ismE
 sXBmiA1Uah8fkiSCow2zEe5H674lWxYrYOy045wDi07wEu36zCXZRI/UbrXz946A+uSv5rkZfHq
 7hzMgLqjcmkhsryfCiyu78A20VUB5fxLOpg//owfaA1EDRmgJIRQATLvIGG3oq+unWTqNdRp
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686eaef7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XSwnDwznb6xmaXktW1IA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: H-L_Nl-t9ufY0wvFN26e7_UvGYOf46i_
X-Proofpoint-ORIG-GUID: H-L_Nl-t9ufY0wvFN26e7_UvGYOf46i_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=897 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_110337_781692_F7FE95B9 
X-CRM114-Status: GOOD (  10.79  )
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

On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Allow pins muxed to the "gpio" or "egpio" function to be requested as
> GPIOs even if pinmux_ops say the controller should be strict.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

heads up for +Luca, I'm not sure how your Milos addition will
stack up chronologically

Konrad

