Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F82C88E64
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 09:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QwC6/Am/Axhts9IelVPAe4AEzQV5uQbp1jHkK1vCAXs=; b=orSBVHarmRRa/hDwkiXzjmAKsl
	A/Ey2Ec7kJxbqqnctDeSpLOUpGCuc2l4AilHYWR8TO/kSkHUjpmfia/EBptkzLFek3HTOO7GwlGAg
	VN0kpgq4MEaSBOlK39cvmOBfF/yyJ6Xx4YWQRC1p4MlvNUEEBaeoclUpBaWeddwfgMojY838ABIo8
	dQBiNfQGdgQbyLzzW04/SA7HsM/cGP32aAnDja2PQifyIWfzGECD/vwejhlDGym7mS9qA0/QV+cZG
	s2JTJucT8WnH8vSbQygb7ipHe42a4RRFj4XxTjHQFc7nzFOnG/hRaDeXgG74LuCb6BZEtRhJ7gRB/
	mM4iKeyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x631Y-00000002y2t-25hu;
	Mon, 14 Sep 2026 09:30:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x631U-00000002y28-19kK
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 09:30:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5inks4057536
	for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 09:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QwC6/Am/Axhts9IelVPAe4AEzQV5uQbp1jHkK1vCAXs=; b=JaxEYh0AgFuASaKu
	libuXqFtXFTaPSkzhi/TZSqE/gMgE3Kb5DiXYnnO6C/lKjVoTG8Z3/iEDGoqZlpY
	MdSHWPMqmEzhmVjY0IjxWAVv6la9fSa2lqPgYVstXCEoxwosnzIbCyKbEwHGCukC
	of6ehNzI13uGONMHKCG7OcAM6k9HnXXSeU29/4BWE1x8BQJG9TSUNug+niSMA08/
	JUBE/ORKYw5lisXX3RMUPHKN7+g1o7eHm1TRTgH+ZtSNTe6FNLzjakK7shCMnr0j
	julbwe4DnRPkHv+9ViHp7g1e88xbyktL1c+KX0bXZwybjYzzJ1yJH1sDBPo7UNs2
	sHDSeA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hssrhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 09:30:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1e564fd5so133430285a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 02:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378246; x=1789983046; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QwC6/Am/Axhts9IelVPAe4AEzQV5uQbp1jHkK1vCAXs=;
        b=G/u8wESNb6MqReG+/+x9vTqPFOfZa3dfPk5FZy4VmPEjFU477kaBGiqJikCKBf9voZ
         CVXLFyabYT0tjMMXAxDDgzRa/YOH7chx8cU1OqWd882mu0WoMEQ3Sx46EL/Cdbj5ZGE8
         igVbiGae+L0nhVfjwN5W5kc0c4BT23nwmHGALxPtSZDzhjJxhkLqOtmnrfaBId4ZECc1
         r5F6GrgwIlIgTMIFraEdkFldKdnyWxa79GKa0sIXsSVrAyP3AZ6KSP+Gostjzg6aMKoR
         4jsMncOWhcquroHpfGMaVQshnVUlo0StnJU7Z3gOYj2PjINe9IwPtbHs/Y9eL/q3SKsS
         zQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378246; x=1789983046;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QwC6/Am/Axhts9IelVPAe4AEzQV5uQbp1jHkK1vCAXs=;
        b=ptugllLlhndBRf54wsC/ANqFQlu7qFeIO676Qn/iRgbVfSdO8m7oVsu8zHXCQfFhrE
         7s6PdbVpfq4KYW5NqsBCOy0D5fEPHf0NTtc/d4T43V4v/B2brGz/Yc0pyHDzJg+xLs5Y
         M9C5nHrrW4rvHIKMUcOMew4zssFsalw+HIMV93RByTW4im1rt00o/yC8VKE4RglqJfNM
         vyC48E9aoSdjIth2laLiDqMfbpVagC3KOLkCI5kuWES5PYtjdPbxmv4Z9T3twZphIUrx
         TDLnEZNC1z3nm+VoZng14V31euJ0XOpVWVeS/eCryg86QtrT05A2XW/42IbqtYiw9/Qu
         93Tw==
X-Forwarded-Encrypted: i=1; AKwUvBxT+eHWPv54QyCuM//fhqS51L4MYMoB6JzKVirC7lrQ2OJ44KO+pMOsdTts9wS2LRJvjYLxBzsAvKgsbeQ6yQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kJ9gOu1pw2tmXY3eOpvATFba9Lsmy3B9mq6P4x8/HHX02kM4mN
	sml9qRoEYsdhX3+gZXP43Pxv6+q4vpiL4bpBV29pDhFnvgznigi1lKwnyp9rDHEyNgwdTb/9mCL
	mNiPALhql1GkfrvgTufevqOKXGaHDReMBeWmy/O160Krx8yada5S52yYC5raSRwLLOV7JaDfKz1
	A=
X-Gm-Gg: AYBFou1KXVA9auYgk3h/Em+Dd20PnD1RsHRUZjYpxRNZyaMUmWBRFhDi0RZLCwyxXIE
	cRz9NBRFvhnVgiKdKlERa9b0Ffu1KnEOP2Pj5SR83h14Rsp9z5DAQycGF9If47rnLzAYwN+vj4z
	wMYKqIbBdxO3wxdz9MTKhsER1QWuM+P1vHLPwXPxel039BbzsTnuzSJEd5i/Xy+r2ELyIcv3Krc
	6fhLx7awWhPcrKTBOX5y3ikwZMi4hZb4FN96lNqUEY/1ElYlDHSy6JWYli6bdZIh0Ju2KI2soEq
	OWcmoVwNEl4kyCfIdorgoSNv1j5l/hBYHTKAO5hA1Zd/Y79ToiIxyD8LiAPOG/kTlzYM7fMiDAj
	dif75BynB0gZkpJ1TcKHI3V/Gx1Ab
X-Received: by 2002:a05:620a:1d0c:b0:939:f9b6:47f1 with SMTP id af79cd13be357-93a29a3955bmr222698185a.46.1789378246605;
        Mon, 14 Sep 2026 02:30:46 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0c:b0:939:f9b6:47f1 with SMTP id af79cd13be357-93a29a3955bmr222688285a.46.1789378246009;
        Mon, 14 Sep 2026 02:30:46 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5968cf3sm3895022a12.31.2026.09.14.02.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 02:30:45 -0700 (PDT)
Message-ID: <ad4b454e-0774-4870-b743-fd0d82d0311a@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:30:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: Use consistent indentation in the
 example
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Khanh Le <khanh.le.xr@renesas.com>,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        patches@opensource.cirrus.com,
        David Rau <David.Rau.opensource@dm.renesas.com>,
        Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Yingkun Meng <mengyingkun@loongson.cn>,
        Trevor Wu <trevor.wu@mediatek.com>,
        Julien Massot <jmassot@collabora.com>,
        Jiaxin Yu <jiaxin.yu@mediatek.com>,
        Shane Chien <shane.chien@mediatek.com>,
        Daniel Beer <daniel.beer@igorinstitute.com>,
        Sebastian Reichel <sre@kernel.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20260913123234.99988-2-krzysztof.kozlowski@oss.qualcomm.com>
 <aqe4U6EJ0cGnV+Al@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aqe4U6EJ0cGnV+Al@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNSBTYWx0ZWRfXzv7xqeByLTLC
 aB/HTc96r4K+OtpyI+njeAAEd+WjsNFyh6mbgh3xAaF1VCSfuJ8D9b1mnm5y75YTO94mQtHP3Av
 fgSlvx8vZzh9hi+2Hb9M6axZZ2e4a4ddiiQQp1LGN4kcBPFg3KQymJA6l4lbk4gUu+wppvXPJlk
 E8inwmitpAbPGKq7ofWKVqqBGmCLbRFleDGy4kXBIMarjibeoE9AlmPmZKyJ+OoOcCyggrQm0mR
 pMDue7u+OBD29CodqQ/Dajsxb4DSqqENqXDl+xOhjLtynehxy/T2BISIKskMSyddfxQXMiJ64em
 PAoqfZuOqVCAv06sxuxhOxrsVzeQ4RhfmHTPMVHR3T8zy2S1XtYqHTA8izJw0OHtsir9PKGD8y5
 dUKGim4iYu6opUtLXL0InY0LpyW3ntJlJ72k4UQyGOKOTRfN+uh70kVICC4PSmbDkJyT69/Ckgk
 6cMga13jVDHkD2dZChQ==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7bec7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=chZs0_0Ys9iI7aL1xjgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 7-cdb5C1YKqNsxVprBitBi01TOemXKp3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNSBTYWx0ZWRfXyFMUDlyp30yN
 MfbjXX72edm/YNpbNSHDfVPtyvE0oPBH8rOYqH1hQwsuop4hXJ2oeGIDLlJunHck2fbqYpK99U/
 FoazdmvT7R6pMcz6nFljtYH/u2BWxS4=
X-Proofpoint-ORIG-GUID: 7-cdb5C1YKqNsxVprBitBi01TOemXKp3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_023048_436513_B9034942 
X-CRM114-Status: GOOD (  14.39  )
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

On 14/09/2026 11:03, Charles Keepax wrote:
> On Sun, Sep 13, 2026 at 02:32:35PM +0200, Krzysztof Kozlowski wrote:
>> Correct indentation in the examples to consistent 2- or 4-spaces
>> indentation to fix dt-check-style warnings ("example 0
>> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
>> re-indenting entire example just for that is too much churn.
>>
>> While changing the lines, correct also node name to be generic in
>> dialog,da7219.yaml.
> 
> And cs42l42 which you also fixup, would make sense to fixup
> cs35l45 which also has a non-generic name and isn't fixed up.


Yes, I'll do a v2.


Best regards,
Krzysztof

