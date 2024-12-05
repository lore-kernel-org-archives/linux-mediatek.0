Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39ACFE7716D
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 00:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXKPzq1F5TX5/uxkKzMSB1NXoT3FhOuw3zI5BP+SzJo=; b=zifv9qOQgVNB/l4DReM9I3IYMz
	Itty2xCYyQ/asljwnvjjy/y87SDk5htFD4xDhSQlHo+c7+VRESyNVVKZRDUo71RfidTgYfrPipmBv
	bRvRnk95TPs4DViQovXYyeyNBDyp8BydZoidBSgV8dVvJ17bfsxOLRKwmrqdpyPRaamLbbwDiQZ/2
	8kaxP3AMNeITJKtsx8N9cWkVuUKSXgVigsb8KUVOyVMaJD5INgnsIMRdxDR9ffLTv+KYJNYGxWSBV
	ntyGpVAHNftVOwdC9XTvs7d0yAjorOF2FJgl2XIfjIbG+i4lkin6XNggTYtHaZ5a2agldrT9cIylH
	oVQo+P4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzms-0000000EMiG-0rvM;
	Thu, 05 Dec 2024 00:32:10 +0000
Received: from pv50p00im-tydg10011801.me.com ([17.58.6.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzmp-0000000EMhg-2BD9
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Dec 2024 00:32:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1733358727;
	bh=cXKPzq1F5TX5/uxkKzMSB1NXoT3FhOuw3zI5BP+SzJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:
	 x-icloud-hme;
	b=NvUB+1QnWMYICgzWlemCLtbKtw0Tm9UBfjUIS4wXxNaGs9onuC2hnMzT/iYvnz07/
	 HOJi6i+ZJu7u9TFjWv6p091BQybVr1dy2GK+s4Y1dBRyb01zFxvkpYzmKIcdYc+f+h
	 EPlThxGXJ2V2jWHZoWnqU8CzaC/gBYpkJxrTxi6CAYmoJiqC5cfkokKhTuJPqzI01y
	 SPAxLX9iaP6k8j/wWV+9x5JN+dMn3a4RipO7xV6ggbD4vgGWQxJbKf7T9HWef6iKb9
	 MWAynZUufAflnI+7Qdg6sA6wGLflOnhzBW2AQHEIridePBX3xOYMQYs1ZNBMu+9K4s
	 KuvLdIcO+3S3w==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-tydg10011801.me.com (Postfix) with ESMTPSA id 1971880021D;
	Thu,  5 Dec 2024 00:32:00 +0000 (UTC)
Message-ID: <18dd5368-d583-44f3-8dd4-74c669ef3bf9@icloud.com>
Date: Thu, 5 Dec 2024 08:31:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] driver core: Constify API device_find_child()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-sound@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com,
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
 netdev@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RvRSqKy8ZqOUE5anLWfZCokK2N1USz-Y
X-Proofpoint-ORIG-GUID: RvRSqKy8ZqOUE5anLWfZCokK2N1USz-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_19,2024-12-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=919 clxscore=1015 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412050001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_163207_573253_B616F9E0 
X-CRM114-Status: GOOD (  10.25  )
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

On 2024/12/5 08:10, Zijun Hu wrote:
> This patch series is to constify the following API:

This patch series is based on the lasted mainline commit
Commit: feffde684ac2 ("Merge tag 'for-6.13-rc1-tag' of
git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux")
to avoid potential conflict as much as possible.

> struct device *device_find_child(struct device *dev, void *data,
> 		int (*match)(struct device *dev, void *data));
> To :
> struct device *device_find_child(struct device *dev, const void *data,
> 				 device_match_t match);
> typedef int (*device_match_t)(struct device *dev, const void *data);
> 
> Why to constify the API?
> 
> - Protect caller's match data @*data which is for comparison and lookup
>   and the API does not actually need to modify @*data.
> 
> - Make the API's parameters (@match)() and @data have the same type as
>   all of other device finding APIs (bus|class|driver)_find_device().
> 
> - All kinds of existing device matching functions can be directly taken
>   as the API's argument, they were exported by driver core.
> 
> What to do?
> 
> - Patches [1/11, 3/11] prepare for constifying the API.
> 
> - Patch 4/11 constifies the API and adapt for its various subsystem usages.
> 
> - Remaining do cleanup for several usages with benefits brought above.


