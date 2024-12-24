Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38361E7718D
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2024 12:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcfWDpvVWNhEetxodKQbf9RhUrYXCg1pOSV/TOgjh8E=; b=McWyemq4QYN6bd1R6/Y9jNsS+s
	fPtVKib5n2Le2UT8ioVM4DkeXt/NNEkdybPsJva5nVA/TFnwJgPETRzgEFrCbI1vk+irGyP7i8zFr
	SxrL8gkCHHbgN3aI0xsdod5a553TPQ0xjl1Ra+rM/TP0R3xbdLosnyPpHKyWb8Uw4LDmZFUn5OO2E
	4rbm/RudCbcwpzICW1LiZWizALDgP+SDvt0qdFfn5tBIk23PZ6Czkbkhq0+pWFr1INR0dxPmYf1db
	A91LuKoT0Z/Rtz7KwYISAIzBFd43hQ3JEbam+gysIxbhqUFRxprG1ww7it0kv06a/Pob6vqs5XL2j
	4/PEx81w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4S7-0000000C04s-1K7X;
	Tue, 24 Dec 2024 12:55:59 +0000
Received: from pv50p00im-ztdg10012001.me.com ([17.58.6.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4S5-0000000C03m-1vzC
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Dec 2024 12:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1735044950;
	bh=qcfWDpvVWNhEetxodKQbf9RhUrYXCg1pOSV/TOgjh8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:
	 x-icloud-hme;
	b=EG3/2JQqEx9JwRea3li9dBqaxu0my5/071veaECaERiiL2HaxnutzGeLfRCkdliQ+
	 l940chB1rDnqfX/zgUAMjMfCU9KCfBl50dd3AYHL+BCjR/LpEszClrwiiaaocUKdO0
	 Dl2mV4JdKdh/0YgEJ9BJeUrYbnqeEK32HyBu1kdqSpd48WyUj+xOOrG2TPE3uWXjqg
	 r0ghBcmj98blLsL7LbynIl9mcuoDXs3AWmbkxfj5bUUIay9lmZdqN/eU6kd0SaVrTM
	 GRnywuJAX30KYKqxhMDjwHXII0rz8Gc6kAVu3/J0Bdy+37cstoObgEcm810pSSyaY/
	 iCj0P90MAhf9w==
Received: from [192.168.1.25] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10012001.me.com (Postfix) with ESMTPSA id 7FC60A027E;
	Tue, 24 Dec 2024 12:55:41 +0000 (UTC)
Message-ID: <16a5d190-29b0-46f5-9845-a1d875211729@icloud.com>
Date: Tue, 24 Dec 2024 20:55:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/11] driver core: Simplify API
 device_find_child_by_name() implementation
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
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
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-serial@vger.kernel.org, netdev@vger.kernel.org,
 Zijun Hu <quic_zijuhu@quicinc.com>
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
 <20241211-const_dfc_done-v4-5-583cc60329df@quicinc.com>
 <20241223203935.00003de0@huawei.com>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <20241223203935.00003de0@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TfHq9KcTAjJLJHGN7Cnpr8airBeAqUiz
X-Proofpoint-GUID: TfHq9KcTAjJLJHGN7Cnpr8airBeAqUiz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-24_05,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=846 phishscore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412240112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_045557_510741_EC373BD5 
X-CRM114-Status: UNSURE (   7.67  )
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

On 2024/12/24 04:39, Jonathan Cameron wrote:
> There is a subtle difference.  In theory old code could dereference a NULL
> if parent->p == NULL, now it can't.  Sounds at most like a harmless change but
> maybe you should mention it.
> 

i did not correct parameter checking for device_find_child_by_name() in
below commit

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/base/core.c?id=903c44939abc02e2f3d6f2ad65fa090f7e5df5b6

since this commit will come finally, actually, this commit is the
original motivation of this whole patch series.

> Otherwise LGTM
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


