Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880F8E63FE0
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2026 16:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OE3KlKPOy54a84VacfHvP1EMsCp8vcEdYuMA1b/mBZA=; b=aqt7SnRPtdOdpi8UOfp+iXQx1f
	mohBDouoQs0LzxDyTqcduGsCG5Dj8fofYCoGJnB2AvFemtQTdu/Nj3ADo8P3TbaoYxNLgPQSZMPK1
	jgmF5eVjxNx9neHd3x/vr3wrK+CRubfBQhakVcWRcCcJ8lidUF8HWgKHWsS+cm/l1AtziUKJq5QKp
	m6GrhSs5veiWpZ4Uw/g6cL4MvdYOGheAuBX80TsaZ8trfl4S/27aH+EXnO+VXoU5YlzCIu/I5Jvxu
	vxDiibw5S7MAuXvS793Pd0p5ZHmpz8jelZBTE8mLc4XqLooFxXx4Y7vnaDSf/WQ7JS+xfIW3UBwcm
	WKJSbUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w94Ds-00000003br4-0Jjs;
	Sat, 04 Apr 2026 16:51:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w94Db-00000003bqJ-1mZ9
	for linux-mediatek@lists.infradead.org;
	Sat, 04 Apr 2026 16:51:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6343jfiD2867146
	for <linux-mediatek@lists.infradead.org>; Sat, 4 Apr 2026 16:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OE3KlKPOy54a84VacfHvP1EMsCp8vcEdYuMA1b/mBZA=; b=aAv9KEZYGGtDdF3M
	OmfW38T63vSNQSDYWE8hzShKvMvj47K+WrQ6D9qDQDUCkhyH4GZSKpa5A9cTfbKs
	cvqJ/8fMfwjreY0AIn7E8Nkw/FS74EMNtkaxjJmGjduV87i5KkY/l81qH2+dtiiD
	C8IZ+RnwOIIWl7qz1jhTEscmQ7FOUILoERhnKa01iDc0hTOfVxOK8g085qN0QP2O
	0PYv34OzdjvBO6mDc1pxcGANn1ZOPn4p3t0Pgr94AIUWZ1qvjcWOZ8uyY9Ob20gz
	pxpcXMatO/Pd5mX7flADZLWbzexqJM0BSUKRiWnKTU+doOJQJ6llSUAN9RSalGRg
	9Ph2dg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dau14s4xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Sat, 04 Apr 2026 16:51:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82d02942266so3250521b3a.1
        for <linux-mediatek@lists.infradead.org>; Sat, 04 Apr 2026 09:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775321489; x=1775926289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OE3KlKPOy54a84VacfHvP1EMsCp8vcEdYuMA1b/mBZA=;
        b=aDCgyOvhwvVi2KWYgkwctMjROg7RPScOnocNQYC5C/oVFxKXOCqLfjSDjm9Hj70gSw
         hnrpAPnjrlcs1KGMcgyjbLrIMFT354wy6q3Rk6XfLpbQ1w/FicRCDtgsOVaUQYCu0+AR
         ZKxIJEx1MnCnOBHouuNhKry0HLT38NdP7DaZU9VvkaAHpxpbZlsbs+Pa5Hb/ZWfYivr4
         j43gSKvO3oyBXTcAytxSfpQObuZoN46HKS3ALKMl4zlxbx4vIa8914yiXr9tzLWB9d3L
         PMeGB6LfhNiffyIDA4tUqgWCFnkACQmVbKJlQtozsX3AlHZHXF0+wFxbsAeKNbIU1vtb
         mhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775321489; x=1775926289;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OE3KlKPOy54a84VacfHvP1EMsCp8vcEdYuMA1b/mBZA=;
        b=V49vWKD8EX6TngFiZoXsvwTqUWW9zqZihZnry5Vib20Xuwwr8QhbJcl+lD+dQFts2v
         U51U/8AJ+9MrU/3uPGD6+urTg/WJUbjAL1iGuobTzr9nhOeWXKjcEIvrg4iMlInWMORl
         cINKg7CzsLXqqtcCaHFNw2XQDIiySLFB0mNpv+caaPmcOjWTQVhjMeIPY8dULNc9iNnx
         sHaKg9eS16ytYYJPw/rbr5T4jlehXvegjX25iH2DtdFf2V1qlnbl2fC0/474RkOZEyEA
         KMKupjhKuqROhJz9hHwEWdMu14L2FmP4BSqrHZbcY1OExR8/eqNcKDtBXvcEuD2w/Shy
         v1yw==
X-Forwarded-Encrypted: i=1; AJvYcCWIsvm2hotmXdYw1jXCoaDqljfa2z+HtdWsS0BSCWr8qXNF/ujrwup9EmKr9F38bt8l3LkCMOPFD0CG0aotIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMhT/QPAge4EBw4rUr2Wlxw+l0M8oSa9Bw4iHAyAlrYR97VHpZ
	Y9AF+JoR2833/0HbXIpJ5hwAM7y8385jFVkbIN1VsxtYDx/6b9WjOaWNlNS1suDk5SY8Ohz5ag0
	IhQVjRVBZDdfGoz/L1nrIPRTqLnPB42L7wqbCk6zsI1PnUnNnrKpt2+QbRQcgXOnmI+Rt6++K4c
	g=
X-Gm-Gg: AeBDievaICsMxfSqHRj0y5Qo9mDmZ9DRaoMEd44uHx/Cj8ei2Erec8j4RZbdCTTg1C6
	6bmLc+k22SiKT4gWGyfutwpcCe4FSCMbJKqesmO+aNnXHHsCvhw6QsQN2Y+EjyzJVFu/xPn5ms1
	VsMb7q8rg8sFzQdDIjS8chkt3qyL3H8bXL2/VsgjyPBS7YHJ6fpLnIrA9uq6m6TYJeyVhxxBXIs
	nFYQoa161lv4pFbInUSLf4nFsXCQY/doQLu6EYV3PUhksHNKOL/VAgp1Ppw5OpCcP2qGnOHGVc9
	MMq2UTyFGaWI0CVZC6CM6SAPGKquHJxnWKk6QBGZaunFd4tkmoWd0q5fRgKDiaqMQ5uRCbfkYCX
	EDyi/MvQFqP/Sy9EzLnf5VSsQ
X-Received: by 2002:a05:6a00:1ca5:b0:823:998:95b0 with SMTP id d2e1a72fcca58-82d0db5b2c1mr6454122b3a.35.1775321488916;
        Sat, 04 Apr 2026 09:51:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ca5:b0:823:998:95b0 with SMTP id d2e1a72fcca58-82d0db5b2c1mr6454093b3a.35.1775321488280;
        Sat, 04 Apr 2026 09:51:28 -0700 (PDT)
Received: from [192.168.31.133] ([2409:4091:a0f4:6806:b530:cb:a537:434d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c9cbdfsm11742697b3a.53.2026.04.04.09.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 09:51:27 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260324093542.18523-1-wenst@chromium.org>
References: <20260324093542.18523-1-wenst@chromium.org>
Subject: Re: [PATCH] PCI: mediatek-gen3: prevent leaking IRQ domains when
 IRQ not found
Message-Id: <177532148383.26157.12106877313693816923.b4-ty@b4>
Date: Sat, 04 Apr 2026 22:21:23 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE1OCBTYWx0ZWRfX65kVr/y09N6u
 qtAJ2zVRf+JitGxhqnKnsx9r9ck2lz/WY/Qc2Wa2zg3H95RBkdjxuN4dzh5xBs8NsUJkcILhZwE
 OdQ0GAPWBwKmdZoxUnlEOZtso2JFQcaBlY6lZKD1GeB0Z71ECmU40f1BYcll1nGa43sG8nepFJc
 EBXwKtm4CxgBgVwQwt2t+7LPX3kPD8NClPgl5fd/XbeF9TTBodakhMaSXIABce+WP6FdiPhk9d6
 QFOaZZVGa6bSSyQODGBqbBIQyG6FX6fGsqH/fqyZkKYLen6cj1KuGestQOkdPOlIZ/8abLbrF/J
 5ApVGrKoGGJWMQgOnJSjoEadV34ToVQ9Qw2LnggaYcpaMCLZQG7AmJIueqoX0XFtk2Ro+BE79sC
 y0K2R6vQfeLllGrE3cUqZcuj8EVmu0SYpbjaD6KVPFSBxJehQERyJIiw5lOO/oOJUUwQxQkxZGB
 icoA1lyLyIW7nCgGVhg==
X-Proofpoint-ORIG-GUID: ate3vV4kSe4gUjKWAI8jjxscbkqMAPO9
X-Proofpoint-GUID: ate3vV4kSe4gUjKWAI8jjxscbkqMAPO9
X-Authority-Analysis: v=2.4 cv=Q9HfIo2a c=1 sm=1 tr=0 ts=69d14192 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=xYFpZzvQZLPhPvho2dYA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_095131_589917_AE76D3A0 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
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


On Tue, 24 Mar 2026 17:35:41 +0800, Chen-Yu Tsai wrote:
> In mtk_pcie_setup_irq(), the IRQ domains are allocated before the
> controller's IRQ is fetched. If the latter fails the function
> directly returns an error.
> 
> Instead, reverse the order so that the IRQ domains are allocated
> after the controller's IRQ is found.
> 
> [...]

Applied, thanks!

[1/1] PCI: mediatek-gen3: prevent leaking IRQ domains when IRQ not found
      commit: 5573c44cb3fd01a9f62d569ae9ac870ef5f0e0ba

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


