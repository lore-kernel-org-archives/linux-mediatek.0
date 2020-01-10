Return-Path: <SRS0=J4iI=27=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FB7C33CA2
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 10:08:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B9D72072A
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 10:08:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qt/CYh+5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="q7++ne3A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B9D72072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYkFMZ2I8F8N5cDfr8XiCvHjjGNy+7Kn0YKlJX81AKg=; b=qt/CYh+5z/0WKG
	nh+BApoGGhHbLtR08ZswVsOLUdYh9vfgJwks78BwOAISmX3otbzITHeXcqOETTer7OUk+wmtavZQ5
	R7GBTsEyqXFQc2y7uE9DRNs4A5jexwamhJuuq/WpKv3BWLn1o4KDuBGCYtXjUY+xJ7moGxW3Jg9Gm
	BWgK9mtG/lYiIsR5FvkblnzdFtmzK50RkUuKcCc1qirtOOCIY6XzWXzZawnvbSZcBRGILRcvaIaui
	EQ21mRUM7He/lfENjSKFX/6OAbCFZXkUAQf4/cdzRmqv83AZSBsBW15cmUo3/qs2gVYP2JFk6so7I
	+dGFH8HETfnfYbjt7I3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iprDX-0005kX-FR; Fri, 10 Jan 2020 10:08:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iprDL-0005aa-99; Fri, 10 Jan 2020 10:08:24 +0000
X-UUID: 5dd8b50e51b747a8812a05ececdc82aa-20200110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=FYP5p0wxJ3QFwXLMGPYrw3vhC17+4GD5PVgVtXVVOhQ=; 
 b=q7++ne3AnzWXWNTq4xNmouj5aa2eDIdlw9sI08/AJ9rMRXmfJLWQPH7JNajbssaEgwEInkfipZG1OEArM7j0VrO1/CGzQMcXpfHV7zAsvIzJee/zsfMX4SgzOmBN5TXLN1ngB2npMiEzvkyKPmwgO6F6tcri2K125pg+ug/bR9s=;
X-UUID: 5dd8b50e51b747a8812a05ececdc82aa-20200110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jungo.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 22888282; Fri, 10 Jan 2020 02:08:18 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 10 Jan 2020 02:08:57 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 10 Jan 2020 18:07:49 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 10 Jan 2020 18:08:54 +0800
Message-ID: <1578650895.3348.18.camel@mtksdccf07>
Subject: Re: [v6, 3/5] media: videodev2.h: Add new boottime timestamp type
From: Jungo Lin <jungo.lin@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date: Fri, 10 Jan 2020 18:08:15 +0800
In-Reply-To: <081d7d77-2bf7-0fc2-60ea-8ba8faa5b6af@xs4all.nl>
References: <Jungo Lin <jungo.lin@mediatek.com>
 <20191219054930.29513-1-jungo.lin@mediatek.com>
 <20191219054930.29513-4-jungo.lin@mediatek.com>
 <081d7d77-2bf7-0fc2-60ea-8ba8faa5b6af@xs4all.nl>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_020823_328292_C0561539 
X-CRM114-Status: GOOD (  19.89  )
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
Cc: ryan.yu@mediatek.com, frankie.chiu@mediatek.com,
 laurent.pinchart@ideasonboard.com, robh@kernel.org, Rynn.Wu@mediatek.com,
 suleiman@chromium.org, Jerry-ch.Chen@mediatek.com, frederic.chen@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, shik@chromium.org,
 yuzhao@chromium.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
 srv_heupstream@mediatek.com, sj.huang@mediatek.com, tfiga@chromium.org,
 zwisler@chromium.org, ddavenport@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hans:

Appreciate your comments on this patch.

On Tue, 2020-01-07 at 15:10 +0100, Hans Verkuil wrote:
> On 12/19/19 6:49 AM, Jungo Lin wrote:
> > For Camera AR(Augmented Reality) application requires camera timestamps
> > to be reported with CLOCK_BOOTTIME to sync timestamp with other sensor
> > sources.
> > 
> > The boottime timestamp is identical to monotonic timestamp,
> > except it also includes any time that the system is suspended.
> > 
> > Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> > ---
> > Changes from v6:
> >  - No change.
> > ---
> >  Documentation/media/uapi/v4l/buffer.rst | 11 ++++++++++-
> >  include/uapi/linux/videodev2.h          |  2 ++
> >  2 files changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/media/uapi/v4l/buffer.rst b/Documentation/media/uapi/v4l/buffer.rst
> > index 9149b57728e5..f45bfce7fddd 100644
> > --- a/Documentation/media/uapi/v4l/buffer.rst
> > +++ b/Documentation/media/uapi/v4l/buffer.rst
> > @@ -662,13 +662,22 @@ Buffer Flags
> >        - 0x00002000
> >        - The buffer timestamp has been taken from the ``CLOCK_MONOTONIC``
> >  	clock. To access the same clock outside V4L2, use
> > -	:c:func:`clock_gettime`.
> > +	:c:func:`clock_gettime` using clock IDs ``CLOCK_MONOTONIC``.
> 
> IDs -> ID
> 

Ok, fix in next version.

> >      * .. _`V4L2-BUF-FLAG-TIMESTAMP-COPY`:
> >  
> >        - ``V4L2_BUF_FLAG_TIMESTAMP_COPY``
> >        - 0x00004000
> >        - The CAPTURE buffer timestamp has been taken from the corresponding
> >  	OUTPUT buffer. This flag applies only to mem2mem devices.
> > +    * .. _`V4L2_BUF_FLAG_TIMESTAMP_BOOTIME`:
> 
> You mistyped BOOTTIME as BOOTIME in a lot of places. Please check.
> 

Ok, fix this typo in next version.

> > +
> > +      - ``V4L2_BUF_FLAG_TIMESTAMP_BOOTIME``
> > +      - 0x00008000
> > +      - The buffer timestamp has been taken from the ``CLOCK_BOOTTIME``
> > +	clock. To access the same clock outside V4L2, use
> > +	:c:func:`clock_gettime` using clock IDs ``CLOCK_BOOTTIME``.
> 
> IDs -> ID
> 

Ditto.

> > +	Identical to CLOCK_MONOTONIC, except it also includes any time that
> > +	the system is suspended.
> >      * .. _`V4L2-BUF-FLAG-TSTAMP-SRC-MASK`:
> >  
> >        - ``V4L2_BUF_FLAG_TSTAMP_SRC_MASK``
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 04481c717fee..74ef9472e702 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -1060,6 +1060,8 @@ static inline __u64 v4l2_timeval_to_ns(const struct timeval *tv)
> >  #define V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN		0x00000000
> >  #define V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC	0x00002000
> >  #define V4L2_BUF_FLAG_TIMESTAMP_COPY		0x00004000
> > +#define V4L2_BUF_FLAG_TIMESTAMP_BOOTIME		0x00008000
> 
> This should be 0x00006000.
> 
> (flags & V4L2_BUF_FLAG_TIMESTAMP_MASK) is a value that determines the timestamp
> source, so these timestamp defines are values, not bitmasks.
> 
> However, I don't like your approach. Whether to use MONOTONIC or BOOTTIME is really
> a userspace decision, and locking a driver to one of these two options seems
> wrong to me.
> 
> Instead add new V4L2_BUF_FLAG_USE_BOOTTIME flag that userspace can set when queuing
> the buffer and that indicates that instead of the MONOTONIC timestamp, it should return
> the BOOTTIME timestamp. This requires a simple helper function that returns either
> ktime_get_ns or ktime_get_boottime_ns based on the vb2_v4l2_buffer flags field.
> 
> It's definitely more work (although it can be limited to drivers that use vb2),
> but much more useful.
> 
> Regards,
> 
> 	Hans
> 

Agree.
We will add new V4L2_BUF_FLAG_USE_BOOTTIME flag (0x00006000.) to replace
this V4L2_BUF_FLAG_TIMESTAMP_BOOTIME flag for better usage.

> > +
> >  /* Timestamp sources. */
> >  #define V4L2_BUF_FLAG_TSTAMP_SRC_MASK		0x00070000
> >  #define V4L2_BUF_FLAG_TSTAMP_SRC_EOF		0x00000000
> > 
> 

Sincerely

Jungo
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
