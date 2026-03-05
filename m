Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D03CF30946
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2026 11:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCaqx93JCAENW1nRSG9AMS/82dshB5hfXtMYMvCEMh4=; b=zkj/1ZAR0F3dPgEadcMznh3Vz6
	4gxXsLAd7S/O6T3Fo8Fhrah2oPBUll3lhb5XE/Z5ioZ5I+eEqe4F1u25MNE1qmoghncm1+Vr3cZgZ
	4X8YSLiVTq2tnoTNxx+3uoOrd1EgXChvxK08KjCXgnBQhCSENhNLNHoFbF7wxSEuHhe0YBws4qXIj
	QgAUbtzHmBZT3Y1pHLQe5NwMv8z7wdV2Iok9pOPD2JwGPBmuNvEoy/ZMXyurfnMkwF3xXPWt5W/7u
	2yH2cFtVwOMeKebEqQnxBu4UA1YcroEQCdOQKbZmb6V1xph0CGDGaCG461byR3UwEpUiFlnuMhdGQ
	w0b5MahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6pa-00000001fwE-3FR3;
	Thu, 05 Mar 2026 11:25:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6pY-00000001fvq-44ZP
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Mar 2026 11:25:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AG4Wi2118288
	for <linux-mediatek@lists.infradead.org>; Thu, 5 Mar 2026 11:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qCaqx93JCAENW1nRSG9AMS/82dshB5hfXtMYMvCEMh4=; b=Bzrtt2GifPS+ynQ4
	60p5eosCH7g26dQb1mKXhfd0YAhCnyWNJbNzKNgy2dCikZlrjxQKqZFMQasyHIVB
	dGEzDAvd9bzxvGV/+FD0xoVVPnr9Q/uiJ7gAs2EeDyuYoWwrTDZqvUWHKzibJ6dR
	6cSx13EqcnUEXMmSc0DJ4/ESBkWNmWAs5zGvir7fvnR4cBueIvwpZUEtpFuR9Ko/
	CVVlDDw5jbx1BZq5XemT5GIQgr88e2hY/IyrapkPxy4V7LX20hvFzIotNSjjboBx
	HulXq2BSW62enSbeixCqzJlAxOFvZnkYjSUZOQJkS4w0Z6wDoA0blgnXtcbBeFGU
	25BgZw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m34k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2026 11:25:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7391540c49so315826a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2026 03:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772709923; x=1773314723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCaqx93JCAENW1nRSG9AMS/82dshB5hfXtMYMvCEMh4=;
        b=W+mGJXQf/CzNoMf5uYDNgcgE4B/gy/IxoQurEJriuoi9bRi65r1s3WyJfFFeD9gLkS
         fXZVJHFhAkFbgu516MWrMCYbSRe5PHEFp73Dui9JhM+CXyWP1xxjuFXUhKl5oMjlE16A
         C3/JZZkHcTZpFpVqbPlgde284tDWCUmtygX4qUHyUsjE9TUnk9tLEpUlh3UQ6XeMQ70v
         qZiDg87JspydMhF61IuboupbaIK7vO9z9MZEcZkHfXXj0J8JXArBnh+ZeTUvx2+diWvr
         IyzHZ9OvxGpjDeFV1qfLbNhrdtEtVmAb8lj/GXafQc1UcVctFCtQbVuLLwuS52cEdxrA
         /w1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772709923; x=1773314723;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qCaqx93JCAENW1nRSG9AMS/82dshB5hfXtMYMvCEMh4=;
        b=iT3A0HVsUaOFMKjbZCQAAHWVKvGj7R7BFjmm/pov12QTVqooDM3vv6/TKw2lwDDw2C
         aEpYjZhCVTpWzwQRtd3eAaxLPg+eqMQttmd0Cv7JMKjkFsri66wrhGPDPXN28cY2xFfx
         +lrglhuKw+iNSNJGorh0U1q5xn84yTwqibSA3LZh44wg6olTiYmh7PU7pJVDufA7Tr8Z
         /Dk6Sbj/EYxFtmcqBb9YVkPtb8kPILezd6enwy9OvWOsIwzVk/OI5YP/nazzjLr5sKfR
         CJhGrlxVc/cNL4ZYb291PmK3GS++VN90Cq4WL0Qbbeo72QaMn7zwaC+HQqUQcSiONIfr
         kbmg==
X-Forwarded-Encrypted: i=1; AJvYcCW0IRas7GYj3ZVJEGSxfy/1jVPLrSHtTXOuLJjo+Co5upTDv2YzA+GtNL4Tt0lZlsVQBpEkcJeew0D0z0Ar1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtNUNVxo6ai6HNWLu/52bqGSiYWpnK0+tRlODqdlqmT47bXH9W
	7moAtZOxOXhUL6juah5ubwDGQtS3vqSDPticDr0s1qFpCqWB/FlcJw+BnZ/mATYKLkUwNQ1r/Oo
	6Lo7TLzJrmGbhWEe/iZCuDmrd0If/TST45PAblEBz92E4XFZTCYZGOS/OKpVLCRJB/98ki9905R
	g=
X-Gm-Gg: ATEYQzzNcmqVVwoVGwn4JHsTF4hl3PnGNSqcGd/03NONwVzDk4CO16Hfo+OJYN1ACU2
	1MqhtEARTupx2yfQETFY3twCXyhDsQ5vPY7HlVVlv9h4YRNb8+BQc9u3ECQGw3xfLsMBHDVGC1A
	ekRauEKtT3RVEpDjqh0LQSoht3n0Q7gYtWNNkIZN2tm037WLkHqCZr0czzzN7IUWLzwYfhLsW2y
	6TKpEchzPKxDsxPlLqUjBuk6cTDFu/5O9bI17XCtBeA66rsxKUSgqz+Z8wGiOqtF+itt75UUOaM
	V3Xd4bKtzYB7UGVjcEQRDCEbQ7/ypekRJLxpuHLoyg4HsAtj30TCDxhOXSXHVaAZU/643HRTasK
	oEpbOzRwRZQsXCc2WeRFQEuU=
X-Received: by 2002:a05:6a21:3d85:b0:398:4bf2:4285 with SMTP id adf61e73a8af0-3984bf242b8mr611089637.16.1772709923234;
        Thu, 05 Mar 2026 03:25:23 -0800 (PST)
X-Received: by 2002:a05:6a21:3d85:b0:398:4bf2:4285 with SMTP id adf61e73a8af0-3984bf242b8mr611061637.16.1772709922665;
        Thu, 05 Mar 2026 03:25:22 -0800 (PST)
Received: from [192.168.1.2] ([2401:4900:88da:227d:1b86:2ae4:5dce:122e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7389126194sm2605943a12.24.2026.03.05.03.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 03:25:22 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260302053109.1117091-1-wenst@chromium.org>
References: <20260302053109.1117091-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH v3 0/7] PCI: mediatek-gen3: add power control
 support
Message-Id: <177270991808.91433.424863497385792823.b4-ty@kernel.org>
Date: Thu, 05 Mar 2026 16:55:18 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a96824 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=cm27Pg_UAAAA:8 a=4KYR80hNXaiQ2IXsO9UA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: pXE3KN3s3XAGDTjN9f5lkE1J8ZD__n1-
X-Proofpoint-GUID: pXE3KN3s3XAGDTjN9f5lkE1J8ZD__n1-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA5MyBTYWx0ZWRfX5N5GUHa0c9s+
 erWUtprrlO0UnuQiSqmbi4I8WEiK1rl32zLHXMp0jllq0fqaO3EqqIePO+24e4b4wXuldtjj+H0
 Hr+2+uzRQ8m+aq/Wx4AheGLL49YtEL2/OcACybIg73wevmK+ADieZfrSu4CtZQPj+/XxZNE2CnX
 lZoVWIB2CUnPE3dx9e7WrnN2g6tS0qs7E3WdQiJe9Lcqz5aXJpx2riMFt0kUvLGUfNJXiJfFwRW
 bu6FdGdLwELoTLELX8te125ISTOwjbqiNmV7o1ixNbNIwhyaT6cZrd8n2ym5N1Rur79ZBKQQKeD
 W5YECnTeQZNBhpVvedGf/BWCYymW4H0Y3bZBCwzkiBb57gZjggODPeXfQoBDvNG9fWT6iSrp9Le
 LD/Ry0rkBQxdOGF+aw3/n9xC+Jw0lOzuGMbuwhrtE9Xm878QV1l1LuP/ctVhV+9QC0onf0lgCc9
 4Pkr+HW/T4YY5RS0C2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_032525_030274_61891B67 
X-CRM114-Status: UNSURE (   9.76  )
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


On Mon, 02 Mar 2026 13:31:00 +0800, Chen-Yu Tsai wrote:
> This is v3 of my MediaTek PCIe gen3 controller driver power control
> support series.
> 
> Changes since v2:
> - Link to v2: https://lore.kernel.org/all/20260226092234.3859740-1-wenst@chromium.org/
> - Made PCIE_MEDIATEK_GEN3 select PCI_PWRCTRL_SLOT, following existing
>   examples
> 
> [...]

Applied, thanks!

[1/7] PCI: mediatek-gen3: Clean up mtk_pcie_parse_port() with dev_err_probe()
      commit: accd5483cf12fe30b99f3d8585921b34c71c0a76
[2/7] PCI: mediatek-gen3: Add error path for probe and resume driver callbacks
      commit: 26781cd7ac6cedb7c669d8ddd384dfd914b8ac4a
[3/7] PCI: mediatek-gen3: Split out device power helpers
      commit: 01ddd5ab62127aeaf05a4ef99a1f566ed739de59
[4/7] PCI: mediatek-gen3: Disable device if further setup fails
      commit: c0275030fb4030be4cb78b460af5bd819d2d8b91
[5/7] PCI: mediatek-gen3: Integrate new pwrctrl API
      commit: 614bfdbba1e224f91affe0e1e71d5672d3807a2e

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


