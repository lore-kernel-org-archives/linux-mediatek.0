Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89721C83F33
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 08:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWSSjZFllEAq3zzYHHlFZWi6GgxQdPObe0q3xggT9oM=; b=WFWVDbFNKCWgKr6akSYwQh77ib
	BuBKixPo3RanEIJdo15wW/mCzHDK9FpFLXzRpAo65Zb+nzndnek6pUGmPFU5r0HDQctCQ0rndLnDf
	YzVVChrlr3tWMLrImXsU6jNcIc/PC7k/i/NEQh2jrbgzrdbq+FRDlfh4J3W5SG7s1ifbShee7jAbl
	I2JEJwnzQdI2XU3L3gaZYUfZpf/0A0L7Q9oGyMTroA3Qz2lA3iTp3onaRu1m0sbxXFAIytIQSkC+M
	WtH4MQHybjsyjzkAprv76vd5YpYcj03ra3bRnCwTypQ787bWKI0MjfUOc5mTIQiY3Amx7hjeWd4VZ
	b+iMfc7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdReV-005YjF-1R;
	Tue, 05 Sep 2023 08:43:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdReS-005Yii-1d;
	Tue, 05 Sep 2023 08:43:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 1CA0CCE0FD9;
	Tue,  5 Sep 2023 08:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6649AC433C8;
	Tue,  5 Sep 2023 08:43:03 +0000 (UTC)
Message-ID: <b756b302-41bc-4e5f-f788-bf61b7f2bae4@xs4all.nl>
Date: Tue, 5 Sep 2023 10:43:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 17/18] media: v4l2: Add DELETE_BUFS ioctl
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
 <20230901124414.48497-18-benjamin.gaignard@collabora.com>
 <814130d1-8597-d567-ddea-cb82cadea00f@xs4all.nl>
In-Reply-To: <814130d1-8597-d567-ddea-cb82cadea00f@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_014312_733710_A8066745 
X-CRM114-Status: UNSURE (   7.92  )
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

On 05/09/2023 10:17, Hans Verkuil wrote:

> 
> You need much more extensive compliance checks for this, esp. mixing
> create_bufs and delete_bufs. And test it with the test-media test script.

This also means that you need to add patches adding delete_bufs support to
vivid, vim2m, vimc, vicodec, visl.

That allows test-media together with v4l2-compliance to do a good job of
regression testing this new ioctl.

Regards,

	Hans

