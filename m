Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46B5C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 05:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9DizQxNPaJXYa1hD7B1Db2MvMlu4k2R5lAEc0ykfW0=; b=gy0Hgq5Mw5O/GR
	eGXdCE38Eh31ZtyVb9hYVl0Hf22xEy5mUdl+vzxp2BoSMTh8uug8aMGHLQx7FG9VJYfwmDvRtyUWN
	nvZlIbnqacYOoGrJoHlFH258eQLLpm2zuHKRf/DHNIRQN1zxp8hlVSjwEYuLpds8RGZPCcKwetfhz
	h+dsdXkQwzGHjKRcQnAaUngt3BpR5TTE5kAFJd9tNl/JUllwLof+yJdbnnHF8EhNwXNULc4pqUis4
	PzZ/i4EZFH06rKdVbmNSdsbrPHBmL9ThbfJEQ2AJNDHTWYXfMeu8T8ALk1YOVbbx+1jz8rdwc0L0y
	OolZK9iRgCCxzVOMfpNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2RdX-002HNT-QB; Wed, 29 Dec 2021 05:36:31 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2RdL-002HJu-7i
 for linux-mediatek@lists.infradead.org; Wed, 29 Dec 2021 05:36:20 +0000
Received: by mail-pf1-x435.google.com with SMTP id 196so17879509pfw.10
 for <linux-mediatek@lists.infradead.org>; Tue, 28 Dec 2021 21:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Nsu5SLu33j/sE27MQRMv94REvtF5KHoUUdJ/rRJCBKc=;
 b=LhGTWxNvS8f/k6IwrYBQ9w+endDRu4HsYOTFu77KuXJeWzeMmaw4hKbczXWI/szDDk
 wS4FZUCSdhkkh2Mn4fAK/stz6O2G7EcqFlEBlPQpKd8E6vA9/z8DzNyE6Ix4EwfqQFOF
 wjEckNlMPsww8Z5MFcn/GJUpSlbdroyWpjmndn9A/3brVFseH0ZbtG8hzf3O0OykSxWZ
 B0ZVZq/f2NHlyuqqmNdQFMZEy5B9BSd62iU0AYsI7oM7jKhW/0J20tjrdxvJVGjuDGF5
 45ARdKJqro60BwRNng8lAOOynIvKiiijeukxyu01rlWZpyq4hFhRrthVM7Kh95aisejd
 ynpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Nsu5SLu33j/sE27MQRMv94REvtF5KHoUUdJ/rRJCBKc=;
 b=c543+Faii25YpD+FlP5geOBFQmXkYYn7n4yJeFPpwwm7krouSQs20as5O15pXMNWN/
 Qcvvz/A8ZZgrAxKrafmbf7wH9FSMylL8fPHqgsf6FO9bkw1cNwkf+3UMpJPSPsIz+Mn8
 hvWCYnHjxHJd5Ldtpn73wufUylcut8ccAEAWRP/C9SGf0TlZZGW+Mu9KXWr/NRl4/jEw
 Wjl+7rhdBSQ2ggBkImTUTI0i30AkbHpi1NsVvT84bt5O3u+twOczZIt5UhRaKc4KQzK5
 YJPvSWIZgiGxvOOZqKxObuVfU5I1T+8PtObN4s9Pesr5bAp8L0Jn1OCAccJ7LTVyCXps
 BZ6w==
X-Gm-Message-State: AOAM530F5icMf3mvyOHBMbfyc4RhoNupvZWoAJEw+h2x5utWepfwoG6e
 MzyJUxs+WuhqJ7avU6UpSB9K+w==
X-Google-Smtp-Source: ABdhPJzQuki0iGD+cAH6k2vcVjIwQQyRJUo+cD69ZoMLZ/4KGBWqzam4XH+vbVYrMkUhzsc3Kiugrw==
X-Received: by 2002:aa7:8bc3:0:b0:4bb:d87:c988 with SMTP id
 s3-20020aa78bc3000000b004bb0d87c988mr25335502pfd.66.1640756178267; 
 Tue, 28 Dec 2021 21:36:18 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:4dea:2b20:ea89:724b])
 by smtp.gmail.com with ESMTPSA id bg23sm20695639pjb.24.2021.12.28.21.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 21:36:18 -0800 (PST)
Date: Wed, 29 Dec 2021 13:36:13 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2, 02/12] media: mtk-vcodec: Using firmware type to
 separate different firmware architecture
Message-ID: <YcvzzZJJBoVtsU/y@google.com>
References: <20211228094146.20505-1-yunfei.dong@mediatek.com>
 <20211228094146.20505-3-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211228094146.20505-3-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_213619_299084_12E4823A 
X-CRM114-Status: UNSURE (   9.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 28, 2021 at 05:41:36PM +0800, Yunfei Dong wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
> 
> MT8173 platform use vpu firmware, mt8183/mt8192 will use scp
> firmware instead, using chip name is not reasonable to separate
> different firmware architecture. Using firmware type is much better.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
