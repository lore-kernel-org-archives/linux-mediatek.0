Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F60AC56208
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2026 09:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uGFZPsBCgFwJjV5eH7Om5II8LwPAjxh0y2RDzYGlUU=; b=H19fk+1I6Nkp89Cf++rWE7t5co
	r6J/TxvWtFFm1rq1H5ZuUxdHL2d9HxhkSst/Fp+7lHz5QD1n3K5H5hKZEvn4CiFkm9hxxu2UL9HKM
	HqgwVge36zqcy1DXtF4VQm5I3EfgxWB66gh+sjpZlfOLdQeO69oJPx3AXvCJ2qGMOh7+uuv8MiKeP
	bS8CgiKjoOtkohgRqwexfXRF4b5uN2jJH4DfIvp0qpl/t/IiJMk43z6s7DC4mbcer7Xxm1PazthQh
	5exAscgNRDQ+t00To494McZU37K+n/50vs3LwfnTeNz4UIzKV7Ypxw0TFdD4dmo87tCnOLJTfdc9U
	AiXLIkLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrufe-00000005T0A-2Ppj;
	Thu, 06 Aug 2026 09:45:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrufc-00000005SzB-0wsI
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Aug 2026 09:45:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769esXQ1558713
	for <linux-mediatek@lists.infradead.org>; Thu, 6 Aug 2026 09:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+uGFZPsBCgFwJjV5eH7Om5II
	8LwPAjxh0y2RDzYGlUU=; b=JEO3uXEzbNrucVVhXi12PE+Fa17umms3V2RDbDvW
	AFfI9MYfOKUndOCZnws4c2e0fib+s3lglWDOc0PO1jaeAshWYSOugh0OsCyUiABX
	AbuPm6oNtq1r57rX/rCWnoDFhEZPS24NakuhvzzZq7AknTFxrwPGdO5V0TAfR3ss
	BgRb8Em/QHdKcPkZLvyqPlL3dOSlB542r34GM2fZlVlUYnXpvlXJPmWOZUHHkDfP
	cpXcj0fhU6tDUW0biLKcFBl6/xT+luRu1AuXuuvCn735RJ9ophdTVIkRdsvI8ftk
	ZIc3upvXv1r2aGhPD8YUsQXzGEtB48W+qZu9UQ3I7wBu4Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8hcbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2026 09:45:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8efad04d884so38265406d6.0
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2026 02:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786009546; x=1786614346; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+uGFZPsBCgFwJjV5eH7Om5II8LwPAjxh0y2RDzYGlUU=;
        b=b5ZfWKbz287UM//2Nt146vi5omLJrYu+Xqw77/pOJNjcLzNdcWdxOKmLIOe0+Mz5DQ
         YnyiYivnw01aj7EgYLCytL9KV5N16UxUb7lzy5hy2oFITEZe/9/ZSBnt96urEOifR0pM
         N4YgNhQgVu6axe37bbMhHK2r8VqThyZ8Vh4VjHCUyAxOWCwBQKNapdqivkK/nVnJKgI7
         6YELGB/e5+rtUpXPxvrhxX6LK6nvNLhvXEF42kaJiOzfZo8jXMwvNUDRHyJTKrDSdlp0
         C+Z6xZB+dehoGzfm2gpfH98TvrJiJSGVui3kXYA1VjPOKd0+wX5HhHr4NQklztmgRxbk
         0Htw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009546; x=1786614346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+uGFZPsBCgFwJjV5eH7Om5II8LwPAjxh0y2RDzYGlUU=;
        b=bR/HLdYECH0BEgBm4ZajUZMytt9RIPAWHQSlEVJfhd7jCnVz4zrQMfpS6u1aXYDcDi
         J9YkQILvV9OO27xNv9cAkfK0CdjwFLcPQwRN64J1fz25h7u6GAH08FacoIjH/tV8b4wC
         Fx54e7K4Oh85LhNiq+DV7w/0/BM7GA6j2VaZ6VcHT4oOTsE5xZ6sqdCNcx4y9RWcInW4
         e0Cn7INcY89IyAI/lHb2FMri1d55qY1CD+6oomNugajJO+LJbyO4tTaS414vt6v3So+k
         ZlOHQ0FkEkcS32/uu33XA5KS1ssyNKVgE+IYno/qUKBl+OwZsNH2fC5ySriKVvDiqo3G
         l3mw==
X-Forwarded-Encrypted: i=1; AHgh+Rrl++sl1FvD2PzI9tYCOKfJcN+JN94Si46aJt/X2P4UC8uhrq+8ZYYbALjKaChUYSmgk7WHI6aC2OJyFPGbVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxH7PKepbUtUPkZHPY2Z5tkJkODqHTjs554doQ68ZFKYZOdUpA+
	voaZBX3S/+Hjxcq5mjboIa7zcqyeCfHRH0Flma9KaFLIh6XCD6Gk+i80kyXtdMaGFdMvbjF/91J
	3K9X/zVq59bIYx4ODyhhPDe5hMcN9cs8HJR0KIMum1k+71O0laRWMRG0soouOzN33KgrAPt/j3X
	U=
X-Gm-Gg: AR+sD10KYsLMxy81+lv7yTTQ/i2NaIPEzPcJ6G24VESo0g3l4xEuxTwJiQNvrpc7mMP
	xYDImTKbTeTFsBL67Y3lJ8tPyMyIv45fSFAqq5NWQa/G3LotRrIszIKfphXSWW6PESjwtniVDTb
	qkNjdegXkuEXD34fXZTZ0IvOVwdJG0cs7qJaEYhpvjH1Jp2eAHvpWz33etwyBRD1uQM3RAtE8SR
	+qDKp7ZILEaQ7xoG2oj/gSiwabG49uXmmPrigL5Xt2CUpnXjLBR+30N4ry2p7Sd6z3qVWAiMKDP
	r9GcMt5yvJ2ZPWAuIeltAiBCmV/FAOT8cTIu7rpp9dm51MXtMEexl3kOMN3KKNenvBdWFy3Jdaq
	HaLUJMK6cmjUyTw+sv3WORA6ukjIl6dm4L4iXAO3Gt5PNSUQzngTXmto0/sCFNHFdY+78a+MJqe
	nNstHl7fW3PnA3LA==
X-Received: by 2002:ac8:6903:0:b0:527:7027:cc1b with SMTP id d75a77b69052e-52d0b220c2cmr176431cf.32.1786009546472;
        Thu, 06 Aug 2026 02:45:46 -0700 (PDT)
X-Received: by 2002:ac8:6903:0:b0:527:7027:cc1b with SMTP id d75a77b69052e-52d0b220c2cmr176111cf.32.1786009546126;
        Thu, 06 Aug 2026 02:45:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f62ba55dsm648098e87.59.2026.08.06.02.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:45:44 -0700 (PDT)
Date: Thu, 6 Aug 2026 12:45:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "weiting.lee" <weiting.lee@airoha.com>
Cc: Josh Boyer <jwboyer@kernel.org>, Lucien Zheng <lucien.jheng@airoha.com>,
        linux-mediatek@lists.infradead.org, linux-firmware@kernel.org,
        Joseph Lin <Joseph.Lin@airoha.com>,
        Albert-AL Lee <albert-al.lee@airoha.com>
Subject: Re: [PATCH] linux-firmware: Update firmware for an8811hb 2.5G
 ethernet phy
Message-ID: <rx5snjmlewatcxis7psqtjggdrdrjsioq6yj56rznh4ood6opu@pscgr3mf5sau>
References: <20260806092834.1391634-1-weiting.lee@airoha.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806092834.1391634-1-weiting.lee@airoha.com>
X-Proofpoint-GUID: bwKgmQOc2G0VeAxtDqYtqu0mKViog_OG
X-Proofpoint-ORIG-GUID: bwKgmQOc2G0VeAxtDqYtqu0mKViog_OG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3NSBTYWx0ZWRfX36rDGgBXTiDH
 /zElTF2P37+qM3YW8UYHgOfBVqGbUijCZ+RTWl8UeGvsycdB69EFhGzQKHlinPsNrf/mhOlySGk
 T2draniOxY+t1HeMVeiM4Frk00LJ6FnD7duNvKqknydQMEjmJ3O7PL1nTPkrfxMCVL9P38jWab3
 /iJpQlUsrUdpAABvWcQdnaJ3iEuxFMjF+ZTT/SKvP9Uhj33WmFHxSNPRgjpa8Jpk4F9aTkolT8h
 qf+bmDlPNLRZt/MXvh6yuexABl9TqFzydfFq15k0Mrs63OEcZfNdRxbGtJOP0cM46u9frVwIWPK
 bFiWEoUWsNVOqHZVG8nEZi2ldf/NQ5SHsFVyd30y0JVbXkEaXOCUGkdQVHTmNr+6j3nXDU3YhsU
 iC6YvPje3MbT9bLyQ7B22yI2hBh/TJVKBa++SyIjkD+m3w90OCMWZguDiE1CaOGDagb7mS4o7MO
 aoJsFn02vQ7jsv3Eypg==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a7457cb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=JGXwu8-eAAAA:8
 a=uDFsXW_6BNhtH2ik2TIA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=-p01NfQuWD51nzoNXB_L:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3NSBTYWx0ZWRfX8lzvbJ1VBmmo
 v+ykrFpRz0Ik8n1NqaZgeqiQYvkntJlsmliPP/kBv/xVVslzE00ENJB/k9XQZFqUNCWI8DDyAI7
 KMPCLtoyM90k4z7OZiswdL7SYWH1T7k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_024548_382724_8E5AE0E3 
X-CRM114-Status: GOOD (  12.23  )
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

On Thu, Aug 06, 2026 at 05:28:30PM +0800, weiting.lee wrote:
> Changes in this version:
> - Optimize power consumption for idle states.
> - Enhance 10M long reach performance for better signal coverage.
> - Optimize 2.5G training process to reduce connection time.
> Version: 26071602
> 
> Signed-off-by: WeiTing Lee <weiting.lee@airoha.com>
> Reviewed-by: Lucien Zheng <lucien.jheng@airoha.com>
> Signed-off-by: weiting.lee <weiting.lee@airoha.com>

Still, invalid tag. You already  have your SoB two lines above,
seemingly having a correct name. Why are you adding a duplicate one,
having your login name rather than your name?


-- 
With best wishes
Dmitry

