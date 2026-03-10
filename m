Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC7CFD2D69
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 12:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=liZ2cxYZp/6QE1t62IyXlp8Jg6pdGNzadfn83X3cLh8=; b=chc6TfqXN2aHlqtXqWnz7I8ejK
	3jPqX9I6r3rIYBRdisOYRpU/2XD32CVhUFVXIJVKw0NRdRO+2d8WKMcY+O7AQ+2gKBYws7fB6B/ZH
	O3bOyc9RGAPJO6JaGah748TFtuhfMkJteJl6DnkEU90srjItnK2Xk3tRkpJPzTikwYSJ/GOJQGvgK
	jPl8Yk9trFAGAO96nK/62lS3nxhUmrHkr0UgEd5p+YpqpC6UoeIgCX+g+FD602U0Lv1WZw71Uq9B1
	3lHMLfXqfdV084LGlIYIryWQPz/DqPYK11qyzFPqAcKesNf+i/zWWi+94/SFCmKnod6IX/o2wFF0+
	9xurw4tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzw9r-00000009TpV-0zRJ;
	Tue, 10 Mar 2026 12:25:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzw9n-00000009Tok-0Zbi
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 12:25:53 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8tm1W3754749
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 12:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	liZ2cxYZp/6QE1t62IyXlp8Jg6pdGNzadfn83X3cLh8=; b=C2E2/h1S9IIaiEH+
	afjDal5/1jJXEex6fe77nvxycyOLnufZhgmzh6+OyjCXfH379LQTXZMBEI8kNSLI
	eP8kAGAFE4TnZlLgVoKX9BD4Yh8N8E7Rh9yxmMRRkFsoWYJoLqMJpQAiOpYDlXsR
	svYHQ5g9EU5N42NKUf1bZqn9KHI2i4vqdLrIEKlIGtuZZdzANPqUT/3Qa0M6SzBo
	441KsnGfXtQlP9U1CnDlaALMQUAf3lByqSZeX6oA8xBcjEUY8Udaxj81x3/spweZ
	Ntbz3kIv8cIVJdYJVPpcHmPC2ICxTG1YKndwfsbX2kzrPeyoCIeUFw2FdayD4/xK
	dAAVGw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477k551-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 12:25:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd81c571a5so1244833485a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 05:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773145549; x=1773750349; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=liZ2cxYZp/6QE1t62IyXlp8Jg6pdGNzadfn83X3cLh8=;
        b=LN8j1bVOJtW1ZQ6SVYNGH757XLZz1Vg1JFnaAZJhJY30O/BHq7i1elxC8dKpHvQaXL
         lKJ+dTdDz0wlgqfLGX2DJEemRnYc7xnuUtPBAk8w4hVOc38CpFuDKa30tHEOmEcl3R/E
         NxtJ7RIYXHdG0wjzGe587QE7Lx6hoNlI3hiSPI52+PRVwf7PP27OIiAyGTMaSoLrFlHu
         nim30vLutzkEPdOzeYQc9WuJAV2HDu/kEgWPREC/nxDFp7XdDMjLaD4ZOhCIezenb6n4
         fQroCOllOQmUB1mCPBVAONuaFXexLBM85eG/F/YVbNZ1NRmrRr8XX9sjj2udjCKYE+X7
         vCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145549; x=1773750349;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liZ2cxYZp/6QE1t62IyXlp8Jg6pdGNzadfn83X3cLh8=;
        b=iucgMT4By8nvWPxhkF4/DJ/Yww+oZ+sLHDHrLwxHqpyj4SXbBYKvQL85ZrJnG+/fBQ
         VRhB7PM3TvH+LWUsePPHhmigeYVIHVv4YLyr/ZrlJWNAimPZaW7Dx3WZPI8+3w45DhpG
         Thdo1JSf5PfaFiat6q4aOFPjZEbf9YoW/1hA/H48n2yo+p3xYslX0dpaq7NufI2Apf5i
         dqmIJ0beK+BAG7NTcyBaI1ag2cl6ti7dh9ERnSYtypELkRtxaqEScfRu0kP7sVBFwEfy
         4GzjyhFIKpToKuiqJktHMK9qrocL9GadQ68lvQhcdTGYuYKFsfTlF2N06227KRvDIesQ
         HVwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCTARh7YZ1ESqSACVkRj6DH9mfk7yjf9TWO7dX93a0rnW500HB6bOlcUnxAsyo+a4iWUlE6mch+L0srn9I5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfjgvdJsU64ZjfbpJ868+VYPECBNeiqKX/i1IeZdtEajkLF8FO
	6gLx9FrCCz4t3oDiD0JK7CVFDemOqbQlCazchCSzhQmELOeLJ8tKcNyNRxa16d+yfsWgU6Yafce
	jJnid+DgW4Z4avPfYze11/SveiK7DYwn3/34WrXecndqATL+z9Z/xy0sRwCbEoZTua0zsmm1/Bp
	M=
X-Gm-Gg: ATEYQzycIjaqvz9a1NX3DBALksUczCRdHap9TeX4q9RrsRZC8Ao/Mx5FbjdjwmgxL22
	pw0Q5bGGrFiFO++SDWuGRFGB1bwAvNkmg9mvRthxwwg/Zs7IJRUuTLIpxA8GIHDWJsvNfRNznTk
	1KMvTY+zXbMh0/Gy0gyWXLf4cdoi0wTSTXsCxhm6XIwqmNjT0KhpYmT28XDaCp1rwBwzkqWAnyk
	ErNs6nsaud/3oCDBPbLTZ/U5+Eg/enoAN31xUZXMZ5v75dB8mzJuuRtkCxgl43DIg7JxIMVmhzI
	uSLnUY5vXWjgCrBspyUJlxiG11D4xTk1ty+v9WUlNxi1O4j4h6HKkxf5EmSGOhU8czikFWrUtpR
	ntC2SOpQs84PLSE1jUm3nCb1yK/u2d3T17ihQcLxcfgH04l+1
X-Received: by 2002:a05:620a:29ca:b0:8cd:982d:4108 with SMTP id af79cd13be357-8cd982d4247mr136295685a.56.1773145549431;
        Tue, 10 Mar 2026 05:25:49 -0700 (PDT)
X-Received: by 2002:a05:620a:29ca:b0:8cd:982d:4108 with SMTP id af79cd13be357-8cd982d4247mr136292885a.56.1773145548994;
        Tue, 10 Mar 2026 05:25:48 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08d8a7sm2641960e87.92.2026.03.10.05.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:25:48 -0700 (PDT)
Message-ID: <b8d70886-3b39-4b1d-a91e-ade3a71a3fd5@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:25:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] remoteproc: mtp_scp_ipi: Constify buffer passed to
 scp_ipi_send()
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Mathieu Poirier <mathieuu.poirier@linaro.org>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
 <20260310-rpmsg-send-const-v2-1-0e94c5db9bf4@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260310-rpmsg-send-const-v2-1-0e94c5db9bf4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwOCBTYWx0ZWRfX3krXJSony1Ce
 rnX22QhcyvqZRmSYNwYKIhBSSDcci5iV5fsvfH5cWnbk0SAdlO2rQr+BQ6ZwrATWcwmfDGn02Qe
 u1BgO7rmRg+RWKiWeudUh+BFzTnux0ZG8rWa8itnyHHWNfwNLrspaoWbwW+32PmIeINMPz6E9H8
 E2txHKZad1pKbZTaG/hfYHFJLVMlKrydSg3NNqrZP3XV6inEEPmf332NhKWhd21cIvJ9rr/x0Ro
 FGH4xNXsLgWxjPJDYx2zMyuZPr0k9FsdYSRC2JtR1ty7jAzOn55q9g4gNdrA5UzaC7TQNTHmb3m
 pcjWMJnyIZpA4KbQr520ug4gcDTpqFzEpdnM/q/mX2nzqydAXiSExfxPomREOA2n6i12NUA8tMM
 57NjqescT5QQRrGOPxKRamiXaet6ulFimN4ZBYxj7m0ERVOLW1e2zx9OyEwPM3jrxE/AtQHZzDo
 ghNwCpT/9EaZ7hAJYKg==
X-Proofpoint-GUID: BQo0Dsi1xsFvz81LvCOHt6juCxb4-kYB
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b00dce cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=F0yalOKIwk99E2MxTuAA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BQo0Dsi1xsFvz81LvCOHt6juCxb4-kYB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_052551_338246_9ADE7D5F 
X-CRM114-Status: GOOD (  11.87  )
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

On 10/03/2026 12:22, Krzysztof Kozlowski wrote:
> scp_ipi_send() should only send the passed buffer, without modifying its
> contents, so mark pointer 'buf' as pointer to const.
> 
> Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>

This email bounces:

"Your message wasn't delivered to mathieuu.poirier@linaro.org because
the address couldn't be found, or is unable to receive mail."

I got it from ack here:
https://lore.kernel.org/all/aS3AU0gEEOvWs4Uw@p14s/

so a hint: it's nice to have templates for responses, to avoid making
mistakes in own name/address. Mine is for example very long, so even I
could not type it correctly...


Best regards,
Krzysztof

