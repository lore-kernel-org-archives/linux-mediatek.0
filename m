Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4294FD875F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2026 12:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ndBnQOcCZwfhVbMkaVHGUIs+rPdGd5HI+jDlLkFWiIM=; b=uqWnGgvaQ/sm9T
	+tlFZNfhDLOlVlZb3so9VYupKi2mH9RtlDzyqLMlvbSjKAXd87Qg9JzX2/puWM3+C5yCV86nJShsj
	+aEAoFB2VPQKimQxZDu1wBJvAsewYfAJtA7eqO4/LbprZqdAbc7z+twxLY4QkO1DxdSyCwoI8dSwd
	LVI9Lpddor0l8mQI96777tuNpXlFKYS+bavcY6yMPM4iuR544NEZBTw8f+BI9IdsXVSZcxduFSQEr
	wuCEREmdlhsjqX6ngSTCh0MOnw+zQl/yLtwbBEm/viUJ0u+4So509BZWVNRDzYw1NJ0GtAsPJCGLh
	GjPycPI5vdo9h4pAqqqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Tfc-00000006JAk-3eH3;
	Tue, 17 Mar 2026 12:37:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Tfa-00000006J9L-47zw
	for linux-mediatek@bombadil.infradead.org;
	Tue, 17 Mar 2026 12:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ndBnQOcCZwfhVbMkaVHGUIs+rPdGd5HI+jDlLkFWiIM=; b=QmM3vHNX0ICLkZKsII89YHB0Fj
	nPhharpDUhuPmsm1gS1PzBNkcZdfH8SMly7gMmrtJuiNEFeMa/SZkaluBpEvKHkbDiv/tC1Vc4fSv
	P/6lpKIetQuSIw+L7SjYNbcn/VfA5E2GlbFhbXoVj2AB8MDsFrfqZTrHBBKXp9rxC2iTX+27AYjvg
	TF+4wjJRQmGeJdK36Z2az1RO62ccObq5LfBGMS+xJqFPg1At/9VnX+1HmwHksd9at6axWMjARyi3S
	C8F1gBmt0flLXjZhViB0ncBSCJis7Aqfv/TOWg6mDuAnlZASEIGJKYgc9BSWZhtXuDcK8k4mXGXMV
	VWR+rxyA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TfX-00000008yyP-1e6e
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Mar 2026 12:37:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8X22k3295207
	for <linux-mediatek@lists.infradead.org>; Tue, 17 Mar 2026 12:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ndBnQOcCZwfhVbMkaVHGUI
	s+rPdGd5HI+jDlLkFWiIM=; b=SosiWWsvX0TCJ0UiWp7jkQKEKjEOfmf33l/VIb
	lyV4XXoIqslNWR6UtAlRGIMEAPH4XUHdT+vGbYWeGU/WOBQWrYBsgWVR0iE9qIau
	gxAFG7xAhVtfyoXw1Bm9wRgezf9bAJyrlGg4OyODM3LXmAGAKknS0SfG23BCiO0F
	3mvlWZhMR131ipAod2yeT3ff7iNZrfv+qD/PNErBY3bGB8e/ZS2VTEyTfb2HCeAC
	5hs1W9WM/NfSr1r8MxJgxZQ0XdrS2lkR7R7exOM+FUgX35058kigu7E8M7gM12Xq
	DnrsVvBEmv7SFIhwbM1J8Yg7j9ujhnbc+f/86LiBHGW9gYHQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy40k3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 17 Mar 2026 12:37:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cdb995a1bfso3815754085a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Mar 2026 05:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773751022; x=1774355822; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndBnQOcCZwfhVbMkaVHGUIs+rPdGd5HI+jDlLkFWiIM=;
        b=aISwyC6VFcg4uVzCsakcZtvBir9AK4jXIWkKRJibzL7AF9BQN/v6MrRx79K+T61ajU
         Z2lEBcRhEjfvjz58VvsnLC8uEB4rfKoyUk9ThHTsGq5BQMNiqJEFbSahZIl45x/V2nGD
         EQAzgVvTBOd9Dxfu0vIUximV+Dn3tEC86H/mbbxhnvla//3GkuaZqnGUKOXyuHdS/nw+
         Y0bgKrWUls64KtszIiD3dTsy7sp8jRtzQG48basjU9CSx89Oa5CvS1h/0hifZNA3U3Yt
         7co9wQ1Ix/H04b6FhotMKvCb/PWkU0o4d0Fx3Hbc2koYNtMJMCt21XYnyhHDZAjvdVrE
         vz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751022; x=1774355822;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndBnQOcCZwfhVbMkaVHGUIs+rPdGd5HI+jDlLkFWiIM=;
        b=keg+N83NPslYYnD1sYKbqLGBwWFsBnY12v0S5R8iLJVxyMWovElSgkoEXbOPiOzBrs
         SL6O7oM4Cx1kvAlKoypoLgvs+Ep7oapIRNq9BnyORRDmLzR/MvpC3KXTV8NeoLjrG1aS
         6AyYMmhpgELfO9TfkPI/nsjsVGiNT5sRNOUwpqvH6H4J3nywJHCm95crlphQomgNM9rb
         nMKOtD6yYKSlctPlm0wcCVI0L9Vmizc4z6IhfmvNIN/GEhsa94c6nVwQY4TIpwGWXiSh
         Kqsfb/o06sGiEeO9jWOC5xVpkb4FKCl2e7QFsm8ITe0nNO8+42ULZnEg+zHPuIan0UGV
         fKcA==
X-Forwarded-Encrypted: i=1; AJvYcCVnnu5zwQawhhj5cS443cRgQY2EhSKhsUW7IfF4D1CHIyHjb9lW8qViEJn+TA0IIz/HezTVhBk6TtYVvhWOhQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf2Akxtw7uH08qne3/saNp1nZ9WzloRv90LrKSqn+VlW/XHT0D
	W96doVWr3sgxgFi2U8f9UOhKfRFZEz5/BH3WQM+HCYkVVV6u3JXX+K3J4nevQepmCmaDk4PQbqL
	31w4QbvkTuiUW4QjMVM1Tt73ZN22obPOQyIevnZjK9LoHH2zDEcSkpxk8YhYDKsNHqT9OXcxmoE
	g8xvkiRXc=
X-Gm-Gg: ATEYQzyXc4n7jbdN/nzKMR6/hQ2OXCClgLMNG/MN3WUoXpzmDY8RqWTXRKVdWcMVpFx
	eSBzJvQ9fG2+XQ+e4S55If3ZkjPp/iVAjWOiZF0fc/p+ymNmx8Ld7iM64dnWfHNJ5ZFGW1IweYx
	2EBgA2eJ76ys8qm0mGWrOzDCyvXEJHfduHPPdevdpS2SUjuelBDjB0h4g4UJQ1VgzoD83B1ToyO
	WPOdbybi3PY7FGxydPNUdb0AOpe0+QNQOZJtextlE3+NKFSKJJuGRGvyumgCV6pdbiXwsuCUs3H
	CLKyF9+EPl9vpgQZ6zWbsrMrt28rEePWDiW6I78cxqFcM5afVrNpKoj9Orh9D6VXHeZtuRd1Yiw
	87wAlxsQinq67ZlzyR46WXZZl1fZNsOyZA6Rr0qnRZAQr
X-Received: by 2002:a05:620a:269a:b0:8cd:9bf2:60f4 with SMTP id af79cd13be357-8cdb5b25e56mr2243336985a.47.1773751022235;
        Tue, 17 Mar 2026 05:37:02 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:8cd:9bf2:60f4 with SMTP id af79cd13be357-8cdb5b25e56mr2243330085a.47.1773751021716;
        Tue, 17 Mar 2026 05:37:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm45556443f8f.14.2026.03.17.05.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:37:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/5] ASoC / rpmsg / remoteproc / soc: qcom: Constify
 buffer passed to send functions
Date: Tue, 17 Mar 2026 13:36:49 +0100
Message-Id: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOFKuWkC/33NyQqDMBCA4VeRnBvJxKXLqe9ResgyaqAam7GhR
 Xz3RqE36WXgH5hvZkYYHBK7ZDMLGB05P6QoDhkznRpa5M6mZlLICqAQPIw9tZxwsNz4gSauUEK
 toNH21LB0NgZs3Hsjb/fUnaPJh8/2IcK6/YNF4IIbDWCOKJSQ5dUT5c+Xehjf93kabDWj/Dm1K
 GDPkckReC5NZfVZN3vOsixf3rvQWf8AAAA=
X-Change-ID: 20251130-rpmsg-send-const-ae216a1fbd8f
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2902;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uPJoi/qVSLB/OsiNzwPHjB8OklNRj/yykobtrrudFXw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuUrjtOnsYsLvrm8S/FkyVJoR3M4nXv6gZd9L2
 IL+Yr/4XnuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablK4wAKCRDBN2bmhouD
 16XDD/9ZiyAJQsI5shJ7BOsxUZSD8H/YUWO9siR+JgwtzJSEnr8oBBz2oXX9p5OWMLfjQemP/eE
 YD/dHx0WIDF/7PLaFPD6iK6JY/qBHZCxGwNTeyz7Oho00lFJJPCKNN4xqY0arQ2emoa9VqOJy3y
 lteojHk1k1HWHHdkyZlxh5J2uoI6ic0qULpbL5Azq20EVgyUXPVshiXNVsetacaqA0lWDI0vdQE
 bydAxp342c0y8yo4KliOksgOD7MXUxdLmTj35ZeW4AcE8zQCr9Q3uFJ9vn9uPrA4DD7L5Gkjy5a
 +TbZ++kW0K80Ll89JH5FyHq/heo1nnjKhzrcTuzZ/S4IuGibJob83j/54ANQuHDsJlaz7deg4/V
 +WOEVBwP3OxXBPuq2bLmlqDMTX1b824bQ+z4jT7jv+MFuxrwSvXbxVUxb/aZ5lqzLHE3wWAnht3
 fjtHUGnE9ttMAmXoPaQ7ZGMlina9DMNOqh1MerQleT51M4ImK7dx3r0FC1bXL7GSDjjG3GP1c/2
 yFGQ0bvtibPI/pcdCKMt5+P3rFAviIc8BEftsx5gf6WcexZbdptUfyerJ56/yzvGgqQbOlNCgMS
 8FBNqg3y4aWc1EFNBtpCEMP3JMJQFowMKfbr1/Yp+WZaTZ2Hp7QCZp0F4gMrYWy0DxBO8cAEfoK
 dZfsaMyLNAxs9UA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b94aef cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=BeD9WHbRS4kTi0j7Zn8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExMSBTYWx0ZWRfX1D7tfyttfo5R
 O/siSEN+Tf3iVdrW4rAKfyU9bD3bm79By5EnvIkVNOh6G98ZB5/4QYeoaJmvnLz/WzVL+fiwFeh
 4JIdxtYGfKviYCQHK9T9vFtboxOBn2ul7PxjKoXv/UBXxPvUQXlOuDLcfUoRLkilpAExnXXX5yM
 jUrK6vAYwuNuL9Yf9aigR4hnBhT2aK6uhvBq/3EYLdMMqkZ/zELnZfyWt2Q25cfYjqPeu1y6Qdy
 oPZJoPSQGQI8Ou/CRjgdQCZkUkcQdy/zy4GKpUJ0PNicZERXk7akuqjL03oXVxVOvw2X4mB5Ffk
 EWGkEGKCHgicrwkAbcMeCrDJl/oCbMuEOyvXBSZ6AamvHeg1ZVCj6wEotetR94YUZ8CKwEHvPyL
 +w6C99QwEkhJdQWNcJCLfEzQnNStN5d9DnyquDJP1GdbvhycbD7DZvs0gGY4c5vNZVelzVv8Nxf
 TaX2aqF92oQKQuWvT8g==
X-Proofpoint-ORIG-GUID: tpK1HoaZGnH_3XtkVTJQ419IbApbx2ho
X-Proofpoint-GUID: tpK1HoaZGnH_3XtkVTJQ419IbApbx2ho
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_123707_683364_E6AC41D6 
X-CRM114-Status: GOOD (  14.14  )
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

This got acks from Mathieu (remoteproc) and Mark (audio), so can we
funnel everything via Qualcomm remoteproc tree?

Dependencies / merging
======================
Entire patchset is one logical chain, all further patches depend on
previous ones, thus everything should be taken via same tree or shared
between trees with tags.  Probably everything should go via ASoC with
necessary acks.

Changes in v3:
- Subject fixes (Angelo)
- Tags
- Link to v2: https://patch.msgid.link/20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com

Changes in v2:
- New patch #5: media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()
- Rebase, add acks.
- Link to v1: https://patch.msgid.link/20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com

Description
===========
The remoteproc and rpmsg send-like functions should not modify data
being sent, so buffer should be marked as pointer to const.  This is not
only self-documenting code but actually increases the actual safety and
clearly documents who is the owner of passed buffer.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      remoteproc: mtk_scp_ipi: Constify buffer passed to scp_ipi_send()
      remoteproc: mtk_scp: Constify buffer passed to scp_send_ipi()
      rpmsg: Constify buffer passed to send API
      ASoC: qcom:: Constify GPR packet being send over GPR interface
      media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()

 .../media/platform/mediatek/mdp3/mtk-mdp3-vpu.c    |  2 +-
 drivers/remoteproc/mtk_scp.c                       |  2 +-
 drivers/remoteproc/mtk_scp_ipi.c                   |  2 +-
 drivers/rpmsg/mtk_rpmsg.c                          |  4 ++--
 drivers/rpmsg/qcom_glink_native.c                  | 13 +++++++-----
 drivers/rpmsg/qcom_smd.c                           | 10 +++++----
 drivers/rpmsg/rpmsg_core.c                         |  8 ++++----
 drivers/rpmsg/rpmsg_internal.h                     |  8 ++++----
 drivers/rpmsg/virtio_rpmsg_bus.c                   | 24 ++++++++++++----------
 drivers/soc/qcom/apr.c                             |  8 ++++----
 include/linux/remoteproc/mtk_scp.h                 |  2 +-
 include/linux/rpmsg.h                              | 17 +++++++--------
 include/linux/rpmsg/mtk_rpmsg.h                    |  2 +-
 include/linux/soc/qcom/apr.h                       |  4 ++--
 sound/soc/qcom/qdsp6/audioreach.c                  |  6 +++---
 sound/soc/qcom/qdsp6/audioreach.h                  |  4 ++--
 sound/soc/qcom/qdsp6/q6apm.c                       |  3 ++-
 sound/soc/qcom/qdsp6/q6apm.h                       |  2 +-
 18 files changed, 65 insertions(+), 56 deletions(-)
---
base-commit: 2360a9a195d2eae6f7d0cac2cbe920ae8a06c54f
change-id: 20251130-rpmsg-send-const-ae216a1fbd8f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


