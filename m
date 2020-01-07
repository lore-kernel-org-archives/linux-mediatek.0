Return-Path: <SRS0=GJVM=24=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA21CC33C8C
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 14:11:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C25D208C4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 14:11:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UbGaJO5P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="oxg8jTOd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C25D208C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OCvmoCraWjdhkoZu96pWYwcjQ1E3VemzR0JJg2rSo68=; b=UbGaJO5P6jdyrf
	O+484a4j08s4FenQMqaO/18EE9/Jp9jvmItdb6dPRHLa2/pRc2huR43zadj0NoFJLZhHJiUp6r3M7
	yYqOx0RCknfJviNbEbr4insrviTD7//QsuqxC3SpobONtdGHRVyIh2PceX+XsGTp+hx9Lcg9u9h4Y
	tan8JphVgD280Nux8mJxjU51yqtIrVM0EZiy1oA7uqVEQBI3puNJGr1R2jhxdmggi2ZXb2X54RovZ
	T1IoyTu6KOgXefl7b3YNEQTB4F6AZjpkTOvc3nBiUiWBpMW50dInx16kCvLSyzo198CFjNZDFJcoW
	djNv65iw45U4R7vaoWAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iopZi-0002NW-BH; Tue, 07 Jan 2020 14:11:14 +0000
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iopZN-0001xy-PT; Tue, 07 Jan 2020 14:10:56 +0000
Received: from [IPv6:2001:420:44c1:2577:cd88:93ae:ae73:3d6c]
 ([IPv6:2001:420:44c1:2577:cd88:93ae:ae73:3d6c])
 by smtp-cloud7.xs4all.net with ESMTPA
 id opZ8iL4ypN9dwopZCiVgkS; Tue, 07 Jan 2020 15:10:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1578406247; bh=pguEJtr3YXsgCMYRTcoUdJnzwuGYLyzb8Cqh5UoRA1k=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=oxg8jTOdB9aQeOquKcvgu3W5i7CI7h/35bf+7sNccPY2SaPOvJK1cdtUYy9mgYuWb
 cb1EVgsNXPa/+Nrcdd2XRBesn3H0Rdo/67Y3r8BKWjqW3RzFa/mcT4qd7fkTOmPet1
 ZXpgF3h/7sj2pU7VWdmdBtQxA+Uu+JuyR+/j3nNpmsojSW4z8APTh35npprgt7sqGV
 BSfM0latdE7FNgcJh/NvW4Qbk0VWJMilL4DT7tfIPo2FU8A9gn4vrhdmtbogt8Y7N7
 6jhMiQPKHYDUtpRNMJLp0E0JeiPWdao1eohc9c54FkUFklN1OUDn6IJxiZ8Y1XfmVo
 DphCJRqdg5cvw==
Subject: Re: [v6, 3/5] media: videodev2.h: Add new boottime timestamp type
To: Jungo Lin <jungo.lin@mediatek.com>, tfiga@chromium.org,
 laurent.pinchart@ideasonboard.com, matthias.bgg@gmail.com, mchehab@kernel.org
References: <Jungo Lin <jungo.lin@mediatek.com>
 <20191219054930.29513-1-jungo.lin@mediatek.com>
 <20191219054930.29513-4-jungo.lin@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <081d7d77-2bf7-0fc2-60ea-8ba8faa5b6af@xs4all.nl>
Date: Tue, 7 Jan 2020 15:10:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191219054930.29513-4-jungo.lin@mediatek.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfNg4Lmkr4KIIXG1nUIxZodemjtl4ShWQ0W2evICZB55dno8LGxE67kMCEJw9sSghQohHNcrwouG4xpcjlzHo5Am0JLdlwqzGkeDEGKBS8PFZ3G18isZO
 9y68pV3DDBBH2gHfJlefyat2LFY87Yl1ozoyJaC1mUt5IX9Dxp1vIeZdznQ0f5g8fBEuK24VslrsKJkRgK2BgFQTlkO0VPRuEgCMYdJ8H+T5iJgOI7gYQKcl
 S5xjJUmQlbst7HeNE3OuEsXyJD8bJJVxcI6tsIS9zpfz21hmAy9oOAng5W6z2Zbpul54997m4hJhF745kDW9gUi7lIFt9UHabq1MQ0RM+revMjo86GXAx0v8
 Khy+oGhi/oJfbHDf1pbsa1DRSm3rVdPhME/aRxeA9AZyBtMekjUtLUZq/llR2jQrNH56k9V4MkMhhszzJJIVyY7aUyyKBJiDFluwrwihF2Tbtn+vMEB7EDMX
 uXtHwhA+GUKCgvls6GADlmRvrJTw2Z6SCQLrltn+OeuWuWJLUM+zp8O5g+GAYFnRBwzHLRDJcNzzxXh4vAFCMCCL3FbnEuvyoM//hizLbmcoQRO59PbfFMWP
 nqqA73mVkF1j7fLqxTSplzbyK5PA7dNx4k7wPlSHzWggbO4jLD/YGMT6HhnbGxwnhgw0w7cJWj6DdMeoYxhZDmERqAXeW7f0ZfU0CUFjBH3pzBcZxoR5Extv
 tKR4aDsSsVNh+bNhwOkS/soscBxba/BesNT4rnQqpJ+2zdaTZOY1bGw7mCcUck/sLXN6A/IRQr30AQ92Ai7S6RpJHebqWR83WWbxrK76aX09ShGRVIiKkBE8
 al+Ehmq7QTKMTaSTWNVmvC/ooqg2Qc7/PT+7pbEq+dQjkCKhjTLripcwgbI9hsNLvg3ZHhFeUQ3qMxEDYYoSXGeiW/binPzepZQS57EKnXnPfHuYm6XICZt0
 LzDtl3IcIUjRkhdbmtREjqqUa8Ua33Q0EbcK0tNs4d9cuRC78f4aMgini6RZNpV+kUdXCzVd5AaZamenIWNXP8ai8YnItD2Ga7Q52nL6eNvpZvNPDzjWTRIv
 henkShlLsNx/GCZystKzkyNUL5dvf6HVTpo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_061054_363893_4A7A0B6E 
X-CRM114-Status: GOOD (  16.05  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: shik@chromium.org, devicetree@vger.kernel.org, Sean.Cheng@mediatek.com,
 suleiman@chromium.org, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com,
 robh@kernel.org, ryan.yu@mediatek.com, Jerry-ch.Chen@mediatek.com,
 frankie.chiu@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org,
 linux-mediatek@lists.infradead.org, zwisler@chromium.org,
 ddavenport@chromium.org, frederic.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/19/19 6:49 AM, Jungo Lin wrote:
> For Camera AR(Augmented Reality) application requires camera timestamps
> to be reported with CLOCK_BOOTTIME to sync timestamp with other sensor
> sources.
> 
> The boottime timestamp is identical to monotonic timestamp,
> except it also includes any time that the system is suspended.
> 
> Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> ---
> Changes from v6:
>  - No change.
> ---
>  Documentation/media/uapi/v4l/buffer.rst | 11 ++++++++++-
>  include/uapi/linux/videodev2.h          |  2 ++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/media/uapi/v4l/buffer.rst b/Documentation/media/uapi/v4l/buffer.rst
> index 9149b57728e5..f45bfce7fddd 100644
> --- a/Documentation/media/uapi/v4l/buffer.rst
> +++ b/Documentation/media/uapi/v4l/buffer.rst
> @@ -662,13 +662,22 @@ Buffer Flags
>        - 0x00002000
>        - The buffer timestamp has been taken from the ``CLOCK_MONOTONIC``
>  	clock. To access the same clock outside V4L2, use
> -	:c:func:`clock_gettime`.
> +	:c:func:`clock_gettime` using clock IDs ``CLOCK_MONOTONIC``.

IDs -> ID

>      * .. _`V4L2-BUF-FLAG-TIMESTAMP-COPY`:
>  
>        - ``V4L2_BUF_FLAG_TIMESTAMP_COPY``
>        - 0x00004000
>        - The CAPTURE buffer timestamp has been taken from the corresponding
>  	OUTPUT buffer. This flag applies only to mem2mem devices.
> +    * .. _`V4L2_BUF_FLAG_TIMESTAMP_BOOTIME`:

You mistyped BOOTTIME as BOOTIME in a lot of places. Please check.

> +
> +      - ``V4L2_BUF_FLAG_TIMESTAMP_BOOTIME``
> +      - 0x00008000
> +      - The buffer timestamp has been taken from the ``CLOCK_BOOTTIME``
> +	clock. To access the same clock outside V4L2, use
> +	:c:func:`clock_gettime` using clock IDs ``CLOCK_BOOTTIME``.

IDs -> ID

> +	Identical to CLOCK_MONOTONIC, except it also includes any time that
> +	the system is suspended.
>      * .. _`V4L2-BUF-FLAG-TSTAMP-SRC-MASK`:
>  
>        - ``V4L2_BUF_FLAG_TSTAMP_SRC_MASK``
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 04481c717fee..74ef9472e702 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1060,6 +1060,8 @@ static inline __u64 v4l2_timeval_to_ns(const struct timeval *tv)
>  #define V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN		0x00000000
>  #define V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC	0x00002000
>  #define V4L2_BUF_FLAG_TIMESTAMP_COPY		0x00004000
> +#define V4L2_BUF_FLAG_TIMESTAMP_BOOTIME		0x00008000

This should be 0x00006000.

(flags & V4L2_BUF_FLAG_TIMESTAMP_MASK) is a value that determines the timestamp
source, so these timestamp defines are values, not bitmasks.

However, I don't like your approach. Whether to use MONOTONIC or BOOTTIME is really
a userspace decision, and locking a driver to one of these two options seems
wrong to me.

Instead add new V4L2_BUF_FLAG_USE_BOOTTIME flag that userspace can set when queuing
the buffer and that indicates that instead of the MONOTONIC timestamp, it should return
the BOOTTIME timestamp. This requires a simple helper function that returns either
ktime_get_ns or ktime_get_boottime_ns based on the vb2_v4l2_buffer flags field.

It's definitely more work (although it can be limited to drivers that use vb2),
but much more useful.

Regards,

	Hans

> +
>  /* Timestamp sources. */
>  #define V4L2_BUF_FLAG_TSTAMP_SRC_MASK		0x00070000
>  #define V4L2_BUF_FLAG_TSTAMP_SRC_EOF		0x00000000
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
