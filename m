Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46181CD98CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2026 09:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Knhl1ddna0y+c4FljL/Lxt/HMyCo8T516/5MkE1l9I=; b=XiFfbSn78H5ovb+YmtFVXU9HY7
	y/beRKL6T0XbUS30GUeroUSInoGcqLU5VKArG9ov5Akf7bBneiNAzCcE96VV8zndiMV0G4UC+s27g
	2Bwnto9nX/pSVrNF/DZIPVSPp087+ugtGQWZ5OIyTfksOgc+pDJvYUWxlF3l7ohedgPybF5JJvDHl
	3g2bbQgpIT8lt2kfWPXu2eR1Pblt6QX3RzgimhnCEu8NSxczfIp+erLMm8AznTVPqvQATxRiXRSrp
	IPtRqGl7L6PBuJfawxq+mGrDlhAOfTL/IVV53YrWR7tL0ruc5USbdazurmtUUvzI27UIvoK/od83i
	CpmGlapg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXc22-000000099vh-43XC;
	Thu, 11 Jun 2026 09:49:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXc20-000000099uL-1QXU
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jun 2026 09:49:01 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GgLw3816384
	for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 09:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7Knhl1ddna0y+c4FljL/Lxt/
	HMyCo8T516/5MkE1l9I=; b=HTXYhWGELZhL6EGdTFiY6kPjdSwirLu9HgyPTmrs
	1U4qi4GjKUAwbRr9T4IZYp2pja6Ct+4Jvy9VTdwKMp4962mtaHYLWkuqmoAchmeV
	lU/PWww3BkhBgArI+IkxgVnGXhR5sJtOG8Ka4jLI8JHYw6kxxkyLoA47eb17qMEs
	BUKcpRHf6OH6q6GmS5/2TE2rqL01AVN4EGzJretpTwTUrkjw57vaBX5w3UILUmkp
	/NBVG9bWAZ7mUsszcuslcPrgNcgjEWpU8fEy14P4UMbkOwITXT/Khh9I2XmKAXX7
	zCbYWJSdUJRPxcIQq2+igmIWqjG3+uW+6vn+Nm+txDJJDw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u2se4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 09:48:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84240683a82so808180b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 02:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781171339; x=1781776139; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Knhl1ddna0y+c4FljL/Lxt/HMyCo8T516/5MkE1l9I=;
        b=RlbcFMLqhBkOmGGam/WLwadE4SAfsBf5D7DPfB0Pfh+jBkICpsV8nNo9N1Ovp+EwUR
         VMRxzOpNSZVRUlAB7aaeYQHv8nskfjhHvBEsVN4DIc1OSuKi+5BWOu3dzm5feByG2gwq
         xW2kW4dJ7N+mLyNN/eLRiS5a9yZPRufUSvZs4N1cTtz5TQakMhvw3RbzXZa5sJiBPHxM
         ZFdujspXVcyMFBmpfgWgozj7AgaQT85rt2rUt/HEsIhcw5ho9u4vWWo03GFthaw+R6XE
         S2hVt6Yd2zFMMeKsNk0GQP9EF12CdT96zYyp5C4GkdKF6zumgVAhCPZyNNNAQOzps6dm
         BESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781171339; x=1781776139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Knhl1ddna0y+c4FljL/Lxt/HMyCo8T516/5MkE1l9I=;
        b=SN8Bv7MjRyma5HVXKlXGfE1nIuoo8bOLdByRtBMEQc4S7tMF7D5J2FQJf8gp80CTDf
         v958XPCzDeoFrntUUwgkvFQjn64fI1D3iiZ3E/2Avt7xdbD6KjIkQ8FcIk05wJIWIOHx
         C50mNN93ikGg/6LyDkGQHKi5s7bFpZ8Rbx56IZQlzAYfCSi/0ZswCWRTSMabF76tEZ5u
         MVmuitkB49yBAQyeRRimqwhE7PEd0JkMliRmuEj1wZEgYB9xGNukRlDqVWBT4qcNCgnZ
         aDQ5vhWAOROe/+x1/N0/0aa0BLj8BlTKubFQNTW7Pu1+nT9i3u69jnSOimz9VK0THSDl
         Er4A==
X-Forwarded-Encrypted: i=1; AFNElJ80FaoffhfnEwHNqM1BsQzHNvWLd8Rj1kbBa6n2i3GgsKElQ+f/hQoLPGkdlxW3YMHgT5Gh6eUhb0fTYnMjVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDOJAcnSI8n+jYR/ByyzSqJbv59ny+p5AvrkOxGwGGDJuGdhCr
	sX7UCIB4C3PU44djN/O5iESbIXVSW+SaRTOWwV32jWPusxL4R0zvcFw+ERBL1Fgge0I6Y1LVNF5
	8KTxEG4fxBENbQiZUeeASi5HR5/kkXbejb0aQwsJ2wcP0zFNq4rmVzTY127+zMiAvQOzfe24Ibc
	w=
X-Gm-Gg: Acq92OHkivR+ktGxRGVPg3YRA6wQg0QC+wShISzTyQiXJp01x9UVyc3topVQSIzT3eB
	hAq5QZ6gtkje4+f1XnqFRXQKg77JKNBNih0B4L0DPmwAVHpddx9UYKu61+0GbQL8nyx3JzREAT5
	agq5F9XDwKd6KiqVyFf+sjKqRvtbU6J6oJJ7TwyKmubQdbmu7CF4hcjvSntxxXg+tCtbPvfuy6g
	rGGSRH7FqZL6X7aIlUo5BbyOCzoNtLFnuivtTTnXDX2RqwRIjszPyP0rwf3s4nApoJTGxVUYWQr
	5p5u9K7ovW9QqezKO5ZsNMapRrOViyWZHUcdIplaSE3fz7ZHM7jzaynm36w/2nxsv5Y5PdA6q7E
	4DmjJjZqShuIhSUFlTvX/RRHle88QiABi/Z6y11qMRFTf2BJnuhUV4kD3pZE=
X-Received: by 2002:a05:6a00:32c7:b0:842:3804:590d with SMTP id d2e1a72fcca58-84335ca2a09mr1911951b3a.7.1781171338877;
        Thu, 11 Jun 2026 02:48:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:32c7:b0:842:3804:590d with SMTP id d2e1a72fcca58-84335ca2a09mr1911929b3a.7.1781171338292;
        Thu, 11 Jun 2026 02:48:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843380c9590sm1945195b3a.31.2026.06.11.02.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:48:57 -0700 (PDT)
Date: Thu, 11 Jun 2026 15:18:51 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] remoteproc: abort subdev stop sequence on first
 failure
Message-ID: <20260611094851.dkg63rqztsv2pre7@hu-mojha-hyd.qualcomm.com>
References: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
 <20260609102254.2671238-3-mukesh.ojha@oss.qualcomm.com>
 <aif8VS0pLYurFEho@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aif8VS0pLYurFEho@linaro.org>
X-Proofpoint-GUID: 9NNk4TsICzYneriX-MjMmrhlbGAx3_uS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5OCBTYWx0ZWRfX5791FvOhg7Tj
 flYCOluzGGNeUNou3tvxHtyaRgQLZ9LCynV3QzXWXtDj+aldU7ReWWaQp70NNrgfqbXCN+emNNe
 4LDBScrHFgdp7XA2j9ofUnYz9IdNhIY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5OCBTYWx0ZWRfX2XOde067BkEp
 tOJBvXd0m1lzVQIitcc2rXm6ysXSQMSv7VVhWLodgQiqQW6+twGkBjguGEElpQ2Dys2K/WuwAJE
 RbJhFSMaoxYw2lGyzW6jfknDHgVQKvvX0RZwBkur7zzkTMifFsHRPQOjMtuQ0IbYNgvJgUaJnuO
 36dUtlCqMENyc4oYAA+cH0NKLQh1NjNlyFwsqiH+B9f2nR8eJkXPv29fNwGO0JJY600Xe9KYJiY
 T1+XDICORL7Vx7FKBYcGd+tzIRRICZ+QLKf0qgHio72B2ltjmgEicZ8MC4vC82oSxQv5cpScv8+
 lPCTxmGz7jull+i+hXyRefk8gBY4a6VmSyG0hy8YzszRAhIqVm79cBOXjxE3AF+iJ06DCaRss0s
 Sev0V7nzeOXwJRSDJw/fp1umXiE6WKtKTpq1qR6+hYj2oPNJDYFsp9gY9EYzRQgGmVy3RS3qShp
 bLXLiK3Jbv7NaKl4B9w==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a848b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ot11TjGKcjkNMLPY8p0A:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 9NNk4TsICzYneriX-MjMmrhlbGAx3_uS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_024900_386554_DE9BFA61 
X-CRM114-Status: GOOD (  23.43  )
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

On Tue, Jun 09, 2026 at 01:43:17PM +0200, Stephan Gerhold wrote:
> On Tue, Jun 09, 2026 at 03:52:52PM +0530, Mukesh Ojha wrote:
> > If a subdevice fails to stop, it indicates broken communication with the
> > DSP. Continuing to stop further subdevices against an unresponsive
> > remote processor could close rpmsg devices that could remove the memory
> > mapping from HLOS and in case if remote processor touches those memory
> > can result in SMMU fault.
> > 
> > Change rproc_stop_subdevices() to return int and abort on the first
> > failing subdev. Propagate the error through rproc_stop() and
> > __rproc_detach() so callers are aware the teardown did not complete
> > cleanly.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> But what would callers do about this? If you abort the teardown sequence
> half-way through you now have an inconsistent half-stopped state that
> neither a new call to stop() nor a new call to start() could recover
> from. That doesn't sound much better than the SMMU fault. Or am I
> missing something here?

SMMU fault result in device crash while other is non-functional remote
processor. From Linux side, we do not know the state of remote processor
when the timeout happens..cleaning the subdevices can result in the
debug data being lost for hung remote processor.

> 
> I would expect that we should either be able to tolerate the SMMU faults
> with the resets involved in the remoteproc stop/start sequence, or that
> DMA gets cancelled by the remoteproc stop sequence, before the buffers
> are unmapped. Perhaps the order of our stop sequence is just wrong? Can
> we unmap the buffers in the subdev unprepare() callback?


IMO, Sequence of subdevice is fine 

 glink-> sysmon-> ssr     start

 ssr -> sysmon-> glink    stop

glink subdevice gets cleared due to which this issue happens.., it will
not help as we are ignoring the timeout.


> Thanks,
> Stephan

-- 
-Mukesh Ojha

