Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB9CC83F1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jul 2025 13:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbtxCizFqVmxij5XWo+R6iw22/lNiJfKJkPmSZ113lM=; b=fgfMlWi0xF3ZC3RZ8usMLN1hpL
	IySEjYxKs1X0BTnC/NpexslPwWG5OsUWiCZ4SYO0e+EKZtvL0pO2VJQXNSwOK28xf9MOIDvXV9KdX
	cib0q5IOvdeHlF+FuuADwE9MUxEdUoNEmQfk1yC+ozbOwlbi8PrEZ+D703r9HS4/j1nvpnly62l+y
	ZXSnjYF4ZyL/QvxpRGa79bmxK93h/EO8sNQaci8bvtiyhMWief/othfR2Fs7GvOzQDIhIgGBEss6R
	EYbgB/WqQfW19YJoZbX/aRZZRx82ND8SwF6Ca77EhRBINKWnafuUJ5LF7x229HPlCKxOYObo8ED2Q
	aFoH73Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrbC-0000000Bzkz-0Ug2;
	Thu, 10 Jul 2025 13:46:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqLt-0000000BlK2-1LzE
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Jul 2025 12:26:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9RGMA016195
	for <linux-mediatek@lists.infradead.org>; Thu, 10 Jul 2025 12:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FbtxCizFqVmxij5XWo+R6iw22/lNiJfKJkPmSZ113lM=; b=NXEEgYd+NswWueGn
	kf2mUE+Mon8YCT33JJSf3IUKY+Olh1LlhK/jbirwF37334gq2xwKoISTazBhDzbc
	2jf0GtiCng+vWYoa+5lP+i+2sNVux0VqjycX6naffBY11yn/U/GiGy80suvXD+Kp
	kUm3VQKes3tTfVGzPTfOozQo0wWqPESkeiof9+y7g7RgSegZ15SJaqUNtBcsCL36
	Jqr6N6nVO1FHS+dxW/12MeWC89YXJ5BlZI5Pcp5OrJZ3HlqEYJRvNnviBAMlHdXa
	HNsmoI/u3yfzKsl5BbUf2XJ3BZ2L2k0zw7zpMEA/ZRmYI0QlGKYLgiQgjIn0lLOc
	1fm1ig==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvefrcfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 10 Jul 2025 12:26:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a804126ed6so3943411cf.1
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Jul 2025 05:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150371; x=1752755171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FbtxCizFqVmxij5XWo+R6iw22/lNiJfKJkPmSZ113lM=;
        b=MkvfrXDUebtyBNj8IxffBN8XEBjpC0Zm7r6hkL5xT4IICKJCHkiLbXtVF0JfA0W5BO
         wyQ5zpKtft3ErdEMnKMcko0J7Nrm6k5jV2T9vPJ66MQoDN5xAuMp8UGa+MqAPwgA7Sz3
         NMb7fS3uWVLh1+JbjyktptnG9Ck49LeS/51NIoDsxXZO03MEZ+DLvsw2JsBJTaqqfBPh
         OLT7znhZGZt0VZTA23SAzXd5RJ2+rGRHcC46bnVcK125EwcYQSedUj2rjXDJXIBbtvoI
         k/I/zvH6lOsWuMTuJp2XQ3Zwxqx1+5vImaZcjRsHZ/SnTJkLdrjhwlby1ahw1pg8Deql
         ZJEA==
X-Forwarded-Encrypted: i=1; AJvYcCWMJ2YN1n+4i/D1t8ZStT8rJtwSOLleCoIm1vGMnSTWPN/rIkdMNQ72BJ6gM51bGFQCXmyB0SXZTXZTb89YaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuOMHIYlJTs57bhzJoekmUYVk7c6nIxU9T5M7xFE8bXque9U6A
	HuIjGVwWx7tZQM2x5mAXdcUoflyeWLnUjXYdupcId1OTF9F8jcSYg+HHfUOZQXvDAh6TOh5Zyfy
	qTfjjpbwrlP6XvudO+HXkVgJisoHT0UoC4UnPwWZu7usDWrqoq5ql8IFmlX8Osipu8QT4URbpek
	0=
X-Gm-Gg: ASbGncvDw1j2fEUNFi0nuyfqTMlO0J5YsTru5n1Qb3Gdy3pSFQ87klILx8Ry6ECqHIy
	/Mo6nrPwcVXOfUjs5wqbQNVqyH7xCtpjkrraBpiOX3FPupiS5oJL3T12of6vf7D2ewYAy9WKoar
	4FvcZFb59oROMu44KM9czP4ne3U9ocayVavcjTrEWrMZcZuoO9bMYlrUw+Zj85A18lFRctGROTx
	y9evePoJb8h1fN6IHS2h6kfAUTpJKZVQKBhq9S0VTL3pOS/vLsF08ugrycoclTV1KbbHC0r/0jx
	isaNXYfp30HQZ/BGDzbPyBB2Y7u3JESiarU03fvjkxURb5I9s7y9YvnRtTEEZaAvYEgpvVPAqw+
	QG54=
X-Received: by 2002:a05:622a:148a:b0:4a4:323a:2d76 with SMTP id d75a77b69052e-4a9decf6af5mr34076891cf.10.1752150371431;
        Thu, 10 Jul 2025 05:26:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6rD3KBw+n4YbMxLbNBGM2hSLhxtVZ+IZYWVEKjer3BHqjIzVfrtLkflN1y+COvTFzgl5lDA==
X-Received: by 2002:a05:622a:148a:b0:4a4:323a:2d76 with SMTP id d75a77b69052e-4a9decf6af5mr34076541cf.10.1752150370531;
        Thu, 10 Jul 2025 05:26:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c95242e4sm821075a12.26.2025.07.10.05.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:26:09 -0700 (PDT)
Message-ID: <1f0debc7-bde0-404b-a395-dc72ca4c82c2@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:26:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] pinctrl: qcom: make the pinmuxing strict
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-12-b6135149c0d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-12-b6135149c0d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwNiBTYWx0ZWRfX0CsqIZrLoSGi
 RSkDmGLDapg3OGwokGksZ9KMScdE6nR9B8MolhOEGvWjzSF5aDTgkL78jbOZQ3ngBDRUb1VK9zi
 lxvjhYlsDpumWZtEZYfM5LW1W4dhqtBg7ONYARiyXPKi5pruIhV7zyw40+jK6//Mv3nOT6iYFGb
 pheu05/aZSI8uopUaj+s7lszeHHJNaZiNAwdJ0N3fqnCupRbDbIYIB++oD5qjox4KvMMm2IkrWT
 ISlF2XHyLGWDXgxoR6MCQT65eWBF/NvVqkdggD6WetJdYFeXo4miZefnRuKUYGbv/p8kzPgOyWx
 cmSh2DgFTSPmcBayMgfe/IfaEcnX2USPXyJDkaVhAzPPW2wI6vRZI9J4/sIAZQz6Am2lj1KUTaw
 7Cn5SUMMwKbgnYo2hV53yLpL8vofWWJxawBFw9NYQ3YrrAdsvmJXlRWMepJ5FF5qjnTbn6U4
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686fb164 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=sOBEMjS50dyNa0exkEgA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: LdXT46-__PBYB76Uu8z9toD8_kl7m4-R
X-Proofpoint-ORIG-GUID: LdXT46-__PBYB76Uu8z9toD8_kl7m4-R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=894 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_052613_489096_7D567DD5 
X-CRM114-Status: GOOD (  11.18  )
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
> The strict flag in struct pinmux_ops disallows the usage of the same pin
> as a GPIO and for another function. Without it, a rouge user-space
> process with enough privileges (or even a buggy driver) can request a
> used pin as GPIO and drive it, potentially confusing devices or even
> crashing the system. Set it globally for all pinctrl-msm users.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

