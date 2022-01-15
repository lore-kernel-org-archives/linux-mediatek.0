Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC612C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Jan 2022 07:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FXcsMT94ppDfa2fTHIzzKbUbZglj6K1or9wlMnW5LJY=; b=OKvZKvtCOlEzEA
	QZLgXHb65nLv19bjJOn0cJogNkosm49hi2/x9COtohQ0Mv5fzK+Z6qV2igE0KKz+Zon165PLMVbzX
	8A6BSlrK7oMc2EWuxk/97qxEBi5A3d+MOfUHQS/y6KmdszapunCg+juEnOuK6LOT7HUkmzB9gypOO
	2i7oI6freaAk3Ep8Ef2FcWQvrCjRZ7EQ+z2eElRESr5XOtzxR8o6NVMwU6GTjKxFNGUQ0oMeVxCWQ
	k7WESrzfLofQogVdwhK8UYOHb0OTMUUwdzQ3gH0wIHWCRgjNe7KfzNCKHgLzcaTeoLyzKpkz5pkP1
	qSgRXfkO1AjQGFWm1LRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8dpc-00AmgI-Vm; Sat, 15 Jan 2022 07:50:36 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8dpa-00AmfG-1R
 for linux-mediatek@lists.infradead.org; Sat, 15 Jan 2022 07:50:35 +0000
Received: by mail-oi1-x22d.google.com with SMTP id s127so15615401oig.2
 for <linux-mediatek@lists.infradead.org>; Fri, 14 Jan 2022 23:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=h3PgS0CNglNFEriFcIB5fPEGJsKvjMbV56HeR6dLGrE=;
 b=EmUyNC5+fyl6EfcWg7V5NP/+/kTDIH/EdOvuowOUADAQekSeyTVMo2Pw+R7MGnNyr3
 5F8QHuI+3uuwmjE0hhIplcSf2WL7/QNRQcOV1244KFMSs7KyWUA1l2Wf6ku/ze8CULMO
 JrK0FD1KD6O13Y02WDkLJ8qPwwJwBY8Rk79Pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=h3PgS0CNglNFEriFcIB5fPEGJsKvjMbV56HeR6dLGrE=;
 b=LIJ4WvufuBQAxR7tulMHAOblQcu/+kP34CKLaWDIVp5H5/Wel1UV0HE14QnPI7IN6k
 3wwdfeKDsoceWXxgDSN5a5jwCFETlc9dztBAYMf+QHQxmZHri2nHUXeLsOVVTzQhH7Jc
 enWvxildcZSUoU2ya2xSxEXZKI2aRU7e+BGmD+yN6jlfJIRKRmRIZmfXYfL0JLHs/3gp
 G7ZUq/XnqQR2CIOUadNlUMurkr15oUN2sDtnfn5JxKP19dfeOnpOoJI2WNbpyIqv3v9P
 rnI/ojB0HUIBY5U3Ib9WCVf0PKBZekCqBJtFXHv4rJlFySOrVdr5Mh5SBzOaydHD79Qf
 DrPQ==
X-Gm-Message-State: AOAM533jU3M21bDw88aAjxN66VSY/GIUQkbCV6YQnEeJ6Zl7KNrHKvu0
 8dyvNJ/ZNIueIMuYRxevS3H0csH5bz3BYKEq9BVoBw==
X-Google-Smtp-Source: ABdhPJx02kIfoT6/5m/ATyYIlU8INhZ26iHsr9xTblSQKWo5tlo36oAirP0TSNUr8dUl4s8qhL52VFzPwIS7Yj/lE4c=
X-Received: by 2002:aca:a953:: with SMTP id s80mr15972957oie.164.1642233032027; 
 Fri, 14 Jan 2022 23:50:32 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 15 Jan 2022 01:50:31 -0600
MIME-Version: 1.0
In-Reply-To: <fc7207eb9958c487fec5679da73d8f3595cc7bb1.camel@mediatek.com>
References: <20220106214556.2461363-1-swboyd@chromium.org>
 <20220106214556.2461363-26-swboyd@chromium.org>
 <1a3b368eb891ca55c33265397cffab0b9f128737.camel@mediatek.com>
 <CAE-0n53Y3WRy4_QvUm9k9wjjWV7adMDQcK_+1ji4+W25SSeGwg@mail.gmail.com>
 <ff81bc1fe1f1c2060fcf03ba14f1bef584c47599.camel@mediatek.com>
 <CAE-0n53FAHDmCznJ35Xh2aTwXBVwukAM3ioKx8SU9VowSaQSqA@mail.gmail.com>
 <69a10908622512c60790f97942731a8ab989b727.camel@mediatek.com>
 <CAE-0n53ao52UX3sJ67UQ3dgj0-DZ0xTeo-NrmW5YVAuXfAnxZw@mail.gmail.com>
 <fc7207eb9958c487fec5679da73d8f3595cc7bb1.camel@mediatek.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Sat, 15 Jan 2022 01:50:31 -0600
Message-ID: <CAE-0n52kPPXuZH8srbQXC6iPpaM_+2Qewn6-HQ0RNKMxi5Jdsg@mail.gmail.com>
Subject: Re: [PATCH v5 25/32] iommu/mtk: Migrate to aggregate driver
To: Yong Wu <yong.wu@mediatek.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Russell King <rmk+kernel@arm.linux.org.uk>, 
 Saravana Kannan <saravanak@google.com>, linux-mediatek@lists.infradead.org, 
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_235034_128016_1B79F082 
X-CRM114-Status: GOOD (  12.75  )
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

Quoting Yong Wu (2022-01-14 23:39:52)
> On Fri, 2022-01-14 at 15:30 -0600, Stephen Boyd wrote:
> >
> > This sounds more correct to me. I'm not an expert on runtime PM
> > though
> > as I always have to read the code to remember how it works. if the
> > device isn't ready for runtime PM until the component bind function
> > is
> > called then runtime PM shouldn't be enabled on the component device.
>
> Anyway, We should update the SMI driver for this case. I prepare a
> patch into this patchset or I send it independently? which way is
> better?

I can roll it into this patch. It needs to be combined otherwise it
breaks the bisectability of the series.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
