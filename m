Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C554FCD8CA4
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2026 15:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMJJ/z4tFmq1ROVKLM1UW2J9lXKDuK2hxDYpfB3TmLM=; b=MoQsL659ArElwcNLncCfE5Dc+u
	g3XlN3SogH4bJIM6aIJeWWksPaKsxwTZnIGglLRMYw8MsPduBSwQHHAz/A2B6Rk0101p7HrfzzNcE
	B9tTYdG1zD07t0Yd5hOAttpBdF3NwmIDABYdV18NVoUWl73+dYPooSs6HUAdA2deBbkP9MMlN8tom
	TR0n/q+NXuVstHyHEtsaKrawQSATfKujvykSjwvxOVDkaympnd26yA201UeG956CCtSsIuZVfR24u
	4uMSRM3IEenLj8u+Dal7jECCpsou/PQvkjg3z6dJNYYpQJdR3QYvGvnAWP/7IG5ktSTvuJV3+o/rS
	qzV549Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWyKu-00000005uQ2-1ZGp;
	Tue, 09 Jun 2026 15:25:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWyKp-00000005uPA-17Fk
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jun 2026 15:25:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClVTC2693960
	for <linux-mediatek@lists.infradead.org>; Tue, 9 Jun 2026 15:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bMJJ/z4tFmq1ROVKLM1UW2J9lXKDuK2hxDYpfB3TmLM=; b=iDiIrBYdlotazEUZ
	OPyfIz2PkBmylecDyPLU/witxmar0q3GzSccaTD+NWakxvgNkbsvsVuse8mbKM55
	JrvpdhjNnxu5vrgjM3o/xKotsYmPQOC694xMre/ZDTukR44deG7U7wv0A1F8FqtD
	6DvzJ1QzQiDLKGPD8/+KvdEpxVz1pwUKFO6yW2PYA4QDUKyMnYwm8jvT/WN7eVPY
	GCAyQHzpLVRnwBL5xfa50FOUNDmOOS4n9TkSLM+VnZcdBQtVrVnFEQwwWD8YbzAH
	CJnrR5NOd2Urbf4Z5OQWk079PAF9gVFuDEIDrRLkCb13gaUKSJsCpuK042RxTnMo
	69cKEg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v1r74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2026 15:25:46 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842446a3851so2779005b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2026 08:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781018745; x=1781623545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMJJ/z4tFmq1ROVKLM1UW2J9lXKDuK2hxDYpfB3TmLM=;
        b=ba/dy+BhMWgLLOFxmOVH63ffUhDNwFbk+yxM5y3+wKRBmDwph9emLapO9MfS4arAzm
         7Dbz5U0YFkqXRQs9q24WWhaTzlq8uC+fPt2HssxgQM9fsc7stzlLRPZgCws1qhbcsJ2s
         XwXGLlCD0EqZtkk/AkHaxA1X9tHyfCKISzuTHqWb6oL5af7qBDq6xiJ8PJJ7/yoV36WR
         5noOTih8dVyPL6zy8Y7dGk2sRyrZw+t6w01oqEhjckFSW4UrSEnrYxP6maRG9rS1+IKB
         vS+ujjA7S0ndPWPzTJ0vJKMNhzfTsktJO0i7xKANcE0aHWVerL3sHecXDJTUAuKzTnAD
         KdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018745; x=1781623545;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bMJJ/z4tFmq1ROVKLM1UW2J9lXKDuK2hxDYpfB3TmLM=;
        b=ATNcbVgGbjMrjLqcUPWs1Ba9Wxj2u12Ox24f+79NnOSpo2Ja9zEUz7LQUnVENUrtbq
         UjnVuRCXhRPl17A9AARcr1T1q9RXPgtWcDyw0dThKj2zdcwtE+DFsQuH0RHSjQIOQatO
         bJ1vtSTaeLzs2I6OhGOq+2zHM2dyguJUJ+H2ve9xQqbjg4DXkE9Rfr1uWKKYNyMkRJ8K
         4GUTwk5OJMBg1ushZVgA1+lJWeL+0X5Utfr1JUgcsX0mNnrGXXNEW16EnlLVYotqvwq+
         J4TOOigzbJBK3PfdKCZOGans0CYhqRbekGHbHL5Gr9L6V11+PTIx8nhRilbpqN6LSuOG
         5wkw==
X-Forwarded-Encrypted: i=1; AFNElJ9Bhqo3uJBzjNE36q/RO4uTM0ZWj9ov+b98SRutdp5/vD3GuLkSwo6JtzHkV89PPIkWiSgWLH5YDwJLzXdTtw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqnSFZcApysXVOy5biP4PakELuw9olaBcaeIdD8bE4R16+YjQ2
	j/sV+Ev5uJqCv9eEKl0nwTsB0EUcAsEpYI36vUw3vwyBtMYi6I7grX1wosT5JC+2ki/QFb9/TOt
	n0sCpU4j9RqpRBeNs374J1Y03HGECQ9SXMkq92GA1DLTibJY7xeRP12u1EcPWsIoalcStAKYBHT
	4=
X-Gm-Gg: Acq92OEfEnIDERr/ial91xvoVgySrNTIyGqcCmlsoV41Hs+ugzXWzs/8bNRYIxMGTTG
	oCSVLyrnx8C1+S7O6uyRKtmmqvXt+hlxnwvPbZHRB9Zhmld+SIF4oXN9S/Wk0KUS4YyzFYJkhIY
	PlpMh7eCoUJMa34bIYJZo1Z9RUZGHkiPBosGuVnhOooqEeOiupL35zoWZ+yb+/RX8Xtp/CicOcR
	bT+iulOfjT4wKo5a1vpFdd15ZUIf6G8aeIqAvPgSwAI4jjk7MtVaxpQMqvPZCY7vu55NYCCM/++
	rH/HqNHLUmG+ZnTnNtPMk6AMHC/UAtG/p6YIXFgjt3sttfZJqGc7WqrgKue0YyqEVO1aFOkhvLk
	6ife0u4CSGKVCTr8n/JGGpVSJ6Lyz+cw=
X-Received: by 2002:a05:6a00:451b:b0:842:7cb7:a3aa with SMTP id d2e1a72fcca58-842b0f86bf0mr20856502b3a.33.1781018744830;
        Tue, 09 Jun 2026 08:25:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:451b:b0:842:7cb7:a3aa with SMTP id d2e1a72fcca58-842b0f86bf0mr20856437b3a.33.1781018743915;
        Tue, 09 Jun 2026 08:25:43 -0700 (PDT)
Received: from [192.168.1.11] ([120.56.203.186])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282880050sm21250746b3a.29.2026.06.09.08.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:25:42 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
        vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
        ryder.lee@mediatek.com, claudiu.beznea.uj@bp.renesas.com,
        mpillai@cadence.com, Hans Zhang <18255117159@163.com>
Cc: robh@kernel.org, s-vadapalli@ti.com, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev,
        linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260518004246.1384532-1-18255117159@163.com>
References: <20260518004246.1384532-1-18255117159@163.com>
Subject: Re: [PATCH v4 0/7] PCI: Add common helper for 100 ms delay after
 link training
Message-Id: <178101873635.8877.10733384254725006435.b4-ty@kernel.org>
Date: Tue, 09 Jun 2026 20:55:36 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a28307a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=eDurORsI8St+1bJHqsJewQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=snT30zDU7jmJpjBr2YoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: -1kIj4HmV0Yl8IPqTHIg9rh3vOF6XK8_
X-Proofpoint-GUID: -1kIj4HmV0Yl8IPqTHIg9rh3vOF6XK8_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NiBTYWx0ZWRfX7avq2Ett0eUU
 cw4nV3ga91tnm0o6JwMgt4s8Xz8NTsMkaWw31FtGjVIkPL9NYToYfj8gB+O7Gfph9Iw1mx03KHy
 xADX5WhwTzevB/zv5bNap+95KEG26GF7Kk0aJ9cs2+yOgq9ZVa0NZ5WFIeEyrDjqPw+ahT64bVI
 mzhhDrR4UZvD0x+p/RNyWk/pN+JLipOd5EdwPHIDB9OkD8LUZNJrmFDChb4JmtJ96tn/42aXdMb
 a2TecOayYCQ4g5/Kpmb3GTtKIUutR9YXqfHtZk03tJPeDoHCOwWsxA0x5i2QAJSH4M4GpFI4I0c
 3KSl2BVVznW7+R5ALU8ukHl3czSha6HCVUqH+SkAsbLB7sHBD4IuZOiIFNaIIjpjMb9AJb0K33N
 6DYVHbJXeCsG0vnOBF8lEmqnle+GKnbKg2gua93J7gcVazdl24IcVC97zRYj5T+8H3ozptSMqaL
 cQDSpU4DKYgVCFolJSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_082547_418961_40701754 
X-CRM114-Status: UNSURE (   9.70  )
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


On Mon, 18 May 2026 08:42:39 +0800, Hans Zhang wrote:
> PCIe r6.0, sec 6.6.1 (Conventional Reset) requires that for a Downstream
> Port supporting Link speeds greater than 5.0 GT/s, software must wait a
> minimum of 100 ms after Link training completes before sending any
> Configuration Request.
> 
> Several PCIe host controller drivers currently omit this 100 ms delay
> when the negotiated link speed is Gen3 (8 GT/s) or higher. Only the DWC
> driver already implements it. The missing delay can lead to violations
> of the PCIe specification and cause enumeration failures with high-speed
> devices (e.g., NVIDIA RTX5070 GPU, PCIe 5.0 NVMe SSDs).
> 
> [...]

Applied, thanks!

[1/7] PCI: Add pci_host_common_link_train_delay() helper
      commit: 29fbf582e75015c031e7965fdd4084af123b9ca2
[2/7] PCI: cadence: Add post-link delay for LGA and j721e glue driver
      commit: 869317b95fd735684057666a65dd8ef95d4bd669
[3/7] PCI: cadence: HPA: Add post-link delay
      commit: 8dd5d65d0dc750b6890c0102c3992f4cef516196
[4/7] PCI: dwc: Use common pci_host_common_link_train_delay() helper
      commit: 681adc339e4c972b9f7a5ef8c2fb6a2f7737d4db
[5/7] PCI: aardvark: Add 100 ms delay after link training
      commit: 8a602b8bfebbf9a755e8f4732132719a3b298b29
[6/7] PCI: mediatek-gen3: Add 100 ms delay after link up
      commit: 798a96740d61c24f193b82388b681b6a4f102d3b
[7/7] PCI: rzg3s-host: Use common pci_host_common_link_train_delay() helper
      commit: 0ae259d0434bc31fc71696355538fd21027d6ebe

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


