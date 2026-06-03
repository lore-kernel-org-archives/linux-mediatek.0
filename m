Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56994CD6E55
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2026 10:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4g1x/DzNmKp7+EQtmsRUP0hUBgY5haHotigrNnUfOxc=; b=Ppy4V7RcKjZmddzl5gBYF7ZDVz
	JouVIjZUEU3yJK6+LWXqFNI6n1H8s7SC3BFfFLSptiMI6LwHcaWN7oANl2+9Ho5FRY0vuJ1hcO+pi
	KihSiQRquC+uwnE41qolGwFG0VNWyJCrBUfPe8dhWOKVwrfE84azieMXnMeytSgfX252/G7WicPh2
	w0XGUnSt648dl5LbtKdDoRpzpkF1NcyVT7csXQZ+lAUJQgl816nqLn4/Q/3BlsQTCJNUv4L6uC5mW
	lwIWLAMfJtQhj6S5IJd1CgxIDHqdtIXMLuUW0vpIyBr+uFwvoApXoDgx7hrrdKCq0BwUk141rMtyL
	Kgw6uwMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUidb-0000000En6y-1QKN;
	Wed, 03 Jun 2026 10:15:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUidZ-0000000En5T-3yLl
	for linux-mediatek@bombadil.infradead.org;
	Wed, 03 Jun 2026 10:15:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4g1x/DzNmKp7+EQtmsRUP0hUBgY5haHotigrNnUfOxc=; b=Nhf2G1DrBaGtPfdnMc7+jr4kbB
	y6KnlkzaiyPt18rcsUSepNAgtAxpywQYMVRbuD/P2Fn+iTHqYGdTwMCCukTKKWRQLZ5fZBTtXD6Re
	kE4qbYfty9bjvsRTw350dJxe7kLHADtcPt4q7fMgHbylEO+bcI1IkpSlj8xjkTsCFTPJQS6kFbCbR
	9dO0KhmYZBnHhJB0xqVConVaqGe9HnRgckwtxSHsyudjoOIHRPZunzkaYEVzeCUy3KZl6nJxST2JG
	V+Bw10xy5qUQ9XubiWTBwt2zN5X+teAiSto2ma6c9XjXmVj/qkyptOCXQNP852Nbdiw9lyM7iFigv
	9KaTtGpQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUidV-0000000BobC-2hSM
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jun 2026 10:15:48 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6539628s780839
	for <linux-mediatek@lists.infradead.org>; Wed, 3 Jun 2026 10:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4g1x/DzNmKp7+EQtmsRUP0hUBgY5haHotigrNnUfOxc=; b=ezZXX1CR+YtOZz1Z
	EOzYTWtnYE5XMPNmnIHFU6HWZOln5nXjTVeLEdaSfNqD9IzhIwA35OfIubwcMLDv
	fqTyH0HPv8F9Cg1uO7kDWXWB59TxQUDjzWVysY00DuGKoHDxZMvj1JsEewvK3q8u
	GqCmqRtnHXeYnF4oJgI1AdoBhsqybwfvKHa3iMtwHIYt8SQ0QkQJQPPcCukeIk5s
	FisxP35gj5LleJgpaez6U3rBC/QGCO4eg7E7Y60rF8d7cB0nLn213R75e3TpiZRc
	klv2vHlop8PV9Clvl94XhjSFPlNfdrk0jxUdE4WVtj7jEDjOgwn5LVanphErilbL
	z2IZkw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejhbb0a3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 03 Jun 2026 10:15:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174d1b326eso12150161cf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jun 2026 03:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780481744; cv=none;
        d=google.com; s=arc-20240605;
        b=Llx1/PJ9AALS663Qig8hnaJ/gSDiIhUeqLHClHMPRvNRA/ky7OttGSI7VKRwI1+V/k
         kA7TyhFrL7KOYPM4Bg8mL1yYErelYzoMNSNCO9SnwRh2RSvpLQebkH0ff+CBGlEmlZNH
         c5o1NNBQNogb/aFMbh5u343ZxAaUsBJ0AZsvd352PDpE8//nW6Wu3SeUf1UTZdkDzhta
         //YEw/5OSLGmwxGXXAJJtiPdxGWudswSEH7B63LVgTojBu8kjAzjnuQk4a1/f3ARX7b/
         NLovjjvHeLD1i0qsn0O+YSWDDxkNe+CqJcn28lvAn+CCjCCp6QExestiqkc36teUnwpy
         GShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4g1x/DzNmKp7+EQtmsRUP0hUBgY5haHotigrNnUfOxc=;
        fh=gt0/VhIXUENeOfnBT4nVY4rXf3E5kVR9568VTP4RvV4=;
        b=NsQhMr2Vyj0hdTlFMLdhtD7yPOyrddVoV053OeztIBa14IXRuk2fcQLTkBRPTUR4hy
         76nowR8gEfNMW77oX7qnFR2uKxF7ez7hLi7y57Jq7RX9+Lb4549uFrqelTO+YLpQTTg7
         FtG3duHPIGXrBqYDfRgGzrSFIoAujn+EpXYeAD6A19zgYk+uXGqXCPvWjvJ4+V9SZq5v
         crPhpwB2v6c6OhtYUplbSvp6uag1oTAPn6D8RLaKxVCpFsohH0D/ighk4ACv4PIonC2Y
         mHjMUibvvZr+aFqLqrGzBvTq7jEpIo3dVvBzRvobHbSLIDGSVxA57KnCtHIFGbL6VwYs
         +Ssw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481744; x=1781086544; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4g1x/DzNmKp7+EQtmsRUP0hUBgY5haHotigrNnUfOxc=;
        b=Das/oSR6OOMSR+lEeH3+xJcp4MyLH1Bgsy6ncaUOKGJ4dFurCnl0uPIxr13u8kfkz6
         oaHco21Nt0YyqLGF96vr+MyTno2OaYliJSNNCVEDQRcmq+/9JTRyKvjypNfKhf2Q5S7V
         hnLvBid+ZzLoS1K2ebRQIc0c40+h9gneOUKL7sfFpyfLn692m+YYkji6jk/z2BJndlAP
         j+SZ3/TDtvg09lzGY3xQTCAtVTaYv+GCV7dBSQP0HJft48NzOmyrE7/koIZI1WVMvPxN
         Obr9SgMABVuF93T+duywdvc0L08yR6C7I6ZW0qAc789KWQQPoBHBPISvvUBldgK1oLGx
         TwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481744; x=1781086544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4g1x/DzNmKp7+EQtmsRUP0hUBgY5haHotigrNnUfOxc=;
        b=DZ1QRblpKaRflIQkX3l0z2EsN5ErAqTCGkvQyF1ZVvtkJLI2nhpDyDgi+GB8T5001t
         F9z6mnsAsneNoedxhRLcuo28VaV8ZWYHxfFGkNvb4Kp5hY3Ap/eZ+EXLx6CkC/hwJf9r
         nch6xN7gmgcQIMQZRICgDILa5J7Fgbe4qjY+eFDuc3YjqcmjeFUNVjNAOjiGWJDGon2n
         ClWCB9zqbHW1FbjoY+k/wtHwtnJFAGnhuOy1oiWkvzRKKH0571NpPf5LhonhWofQ9sQ/
         4kNzVKCWpuv2mFDZKBnopvK74L+2l+oBQJsH34gJHBkrDy7pczHW2I9PA4dXLeB+m357
         Wwcg==
X-Forwarded-Encrypted: i=1; AFNElJ8jPCd2eYTKI0R3f/K5bl8blhiNy4W8ytc5aBLI9F/qq9rMObdWPGoyAcBFrKTXREHGSHB3xHgzErQEAwjb5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxTzUImALJPKtL1jXOh1xZAxQQ66vh0Qv/4Y2e25PuiJj8EEog
	IzYbZcWl+t7NN6IlSVPvEXW/Mj1X2aYoLDI2W++qRExd8/a+x/8nx0TooVzaCH/gS0hK8rKCxdI
	64hlGDVTiuGNXkBnMgX0XGEUime5BP7p+spnXZoibLTx18434W+GmEQvyNfEuJmzDHGKs4itE9v
	3gI7Zo46PQP7DXt7yhad/38AWKDI7LH5Rghr4Cd2UNFHhTLOqr9A==
X-Gm-Gg: Acq92OFmVBn7UdgQjFvwZ/OBaVnNqBSvEiAnEmPaC5W/q6BUKbBUHDj4kqiuMSUs4rf
	1t0JUp7f27DYuEpXqqxZu3mHmDYodj32tx5oWtbBBk6usIsbYbNg4u596HOSL/zvTDFie0AORsG
	5yEpizawk4FrxKBuVLpsnk70yX6hW5OReKhLtBdjy6GQHhFzi9GNLDGcz1VMLbFyKIYUscrXmJL
	vDranYWTIAcQPDz
X-Received: by 2002:a05:622a:8d12:b0:516:d66e:7b1f with SMTP id d75a77b69052e-51778705ddamr35756731cf.31.1780481743701;
        Wed, 03 Jun 2026 03:15:43 -0700 (PDT)
X-Received: by 2002:a05:622a:8d12:b0:516:d66e:7b1f with SMTP id
 d75a77b69052e-51778705ddamr35756461cf.31.1780481743337; Wed, 03 Jun 2026
 03:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260528202455.136618-1-rosenp@gmail.com>
In-Reply-To: <20260528202455.136618-1-rosenp@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:15:32 +0200
X-Gm-Features: AVHnY4KtDx-pa93XzpTaccSbjUaGmCNCCMJjyEwZU8dcHZlGEEBgW87g_qR9iag
Message-ID: <CAPx+jO_4Es8x77Jv3Lf0E0zWjFpaoCaVKwWMPkQLHzaPf0G+bg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: mfg: move __packed after struct name
 to fix kernel-doc
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-pm@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: -e7qxxh73CAohpbWDNqyKMbuA08HLZo9
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a1ffed0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8 a=0t7_9_tBnCl6T0_iKv8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: -e7qxxh73CAohpbWDNqyKMbuA08HLZo9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfXwddPzZdo8oyo
 MX26JKjajCK8BlwFhMLylpbiiR87TWOpLFvMy0LhkIEWs7NL/DuKygyjxAnA7DqW1RP06L3T0V9
 TuUhUWNmVWUB3eJuxGBElu5ALyP4YiNT8Asxbg8/6udjefdnwX9Q7Pz+TRpe74tI932gt76AHMi
 hh0jkMwG3Rnh6n2OUBNi61jogLuNBVPu9IS1KweZ9j61zao7xwM2OgeEVnmwz86gBiGo9tocYCd
 YeIsIfpegXhbqCVscFhipShWSVaTxUfefW7XZqYmCLRnB10c0gz+WQkTe/XyqUoLRRAwGdCRrX0
 ItIIlTpwxHq5/v/aowuQsi3JXn8qUtRM5T8HYIafIQ+62UPE21KYuX0igwoEu/fTSRwsbrTS+lN
 Lkkfyo7j+7ryyg+ykHZFgNcH0LQll5c89crlnhR1J6kuOstSfJaPtfES3EBmUCucNMQmgunu0py
 zW0Kf9H53Sp7Ia/HIOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_111545_977773_FE369B5B 
X-CRM114-Status: GOOD (  17.40  )
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

On Thu, May 28, 2026 at 10:25=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> The kernel-doc parser cannot parse 'struct __packed mtk_mfg_opp_entry {'.
> Move __packed to the closing brace, which is the more common kernel style=
.
>
> Assisted-by: Opencode:Big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdom=
ain/mediatek/mtk-mfg-pmdomain.c
> index 3ce6fb74dd53..53bdab66cf15 100644
> --- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> +++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> @@ -236,14 +236,14 @@ struct __packed mtk_mfg_ipi_sleep_msg {
>   *
>   * This struct is part of the ABI with the EB firmware. Do not change it=
.
>   */
> -struct __packed mtk_mfg_opp_entry {
> +struct mtk_mfg_opp_entry {
>         __le32 freq_khz;
>         __le32 voltage_core;
>         __le32 voltage_sram;
>         __le32 posdiv;
>         __le32 voltage_margin;
>         __le32 power_mw;
> -};
> +} __packed;
>
>  struct mtk_mfg_mbox {
>         struct mbox_client cl;
> --
> 2.54.0
>

