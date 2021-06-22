Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FB4C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 09:49:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E3C661358
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 09:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E3C661358
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhe16HiabsG3KoXhe5QfH88pNj/9v5lQgpNC3hB5kuE=; b=JLpz6C2bOeP/kO
	Y7MesU5VjAXVHATNiL4tJUYBLK0aIp+chG9te2jwZFHjEbkJLSZsZzP8geUslbE56A5xMSrltnto5
	v1PTCgXkcO0gC3QzTRwNK42w3Yr6umcnqoLm8Bu/b6uJHCvJqOcmbDDqOzjXkmuHSpF34crumA1dF
	3kSDsPbHhFrhNzW7DwffRXSreZV4Cr82cvIv1ERDYHe26sWRtznQH93R41LwKqwAUrpvo+QONmsZX
	avwPyMcKd3eb9Bx0rHwGVLx9/7b2tas8ZMibgffeitNQdUTgRtLndGMV8jrnZTTTi40+ecxwqkJfw
	+7/2+D4bc3d0P+vwQ72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvd1p-006W8J-Pl; Tue, 22 Jun 2021 09:49:09 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvd1c-006W4u-8d
 for linux-mediatek@lists.infradead.org; Tue, 22 Jun 2021 09:48:57 +0000
Received: by mail-ot1-x32f.google.com with SMTP id
 j11-20020a9d738b0000b02903ea3c02ded8so20629597otk.5
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Jun 2021 02:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nD+1l6o05xmy+VeXlqHaYhc8wOEE+zvUKMP+aUukBYM=;
 b=BlLwkz0QZDydr7SNM/bXhFBnc2kM0mgn/8nn8V4kWzH9i/a9lVOPNtE9iMb+8YxrjR
 Mre/2mnFj/gq9qoQWjBGg+cwAKwjWqplxPF1cc4dbTWk2WR6RkvePXJGOcUECIbduaJQ
 Rro3+vkRKKb1LH9E7BcEIjx0ZAZMyfT8ZUiB02OX/3bVF9cBIZGK+wgNd17pxGEtguwR
 Q0JI8sK6nnov+RxBQN5QkiwyIw4DSZSL8ixAkFWnseaVz1p60+VDHqKraA8oZZzw5Zvx
 2B9BJqVag8BpyTihdC9ZYwjxX6haC1k79P/yC3tWAp+JeJAlL+15rgMgthykfR7atUhl
 WMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nD+1l6o05xmy+VeXlqHaYhc8wOEE+zvUKMP+aUukBYM=;
 b=iayXCL+vNkET0dYdw4cYnIe4vJ5yqZtVP62jiWPkOgb0G7ggaEf+fTJObZB5ix9UON
 XGTQG889ZiiajTCgWzpIFMcaevUstfWA/eYdJDTMXoNYlzp0TJ6MGNRGCbjnh6rPNJqI
 LUDg5lDU13tdYRSVPGFpX90nZAGPjwQ4ynCaPuRt2njVy7AnOsOadKnpTEu4RQqdvu2Z
 Y66yBOmuxkF9a8MJbbMWtsLFTh5Q1+CY1FQ4oKX3G49096PQIvM9GHHNqzhu9jl7G3ju
 Z6/7V1izQXeYxRfWBbPOqR/9t2USd+6vqkdS2d7OiWFCMaox36N/ruUVlnkb0tOJEiMO
 6SfQ==
X-Gm-Message-State: AOAM533tvidCVPEOhXwZ4arjinkvE9GV4z9dqq6uzNtrte+4/hgfGVrR
 gIyb1sVhRyPswudpuOWtAS3+T8Rwnn9R+GS4xFl7KA==
X-Google-Smtp-Source: ABdhPJwI4wpym27x4pBWkuYhL+X3gpT+E2b8RxSSxNrlJWT0CL0jEM4nvpVx7PzkmNccX3NLHdQxN4J4vmhAa2geJnw=
X-Received: by 2002:a05:6830:93:: with SMTP id
 a19mr2377707oto.17.1624355335059; 
 Tue, 22 Jun 2021 02:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210620114756.31304-1-Kuan-Ying.Lee@mediatek.com>
 <20210620114756.31304-3-Kuan-Ying.Lee@mediatek.com>
 <CAG_fn=UTfR9yKrkdRDjxFn=vgR_B7kzytm9WDWT14Gh0PLXyJg@mail.gmail.com>
In-Reply-To: <CAG_fn=UTfR9yKrkdRDjxFn=vgR_B7kzytm9WDWT14Gh0PLXyJg@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 22 Jun 2021 11:48:43 +0200
Message-ID: <CANpmjNPdaXj0egTTX6CmJonNM2UgbQPqza5Ku9u+ariJ8CQx_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] kasan: integrate the common part of two KASAN
 tag-based modes
To: Alexander Potapenko <glider@google.com>
Cc: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>, 
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-mediatek@lists.infradead.org, wsd_upstream <wsd_upstream@mediatek.com>, 
 chinwen.chang@mediatek.com, nicholas.tang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_024856_336592_47E72859 
X-CRM114-Status: GOOD (  17.47  )
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

On Tue, 22 Jun 2021 at 11:28, Alexander Potapenko <glider@google.com> wrote:
>
> > diff --git a/mm/kasan/report_tags.h b/mm/kasan/report_tags.h
> > new file mode 100644
> > index 000000000000..1cb872177904
> > --- /dev/null
> > +++ b/mm/kasan/report_tags.h
> Why don't you make it a C file instead?

Yes, good point. report_{hw,sw}_tags.c essentially define it, but it's
called by report.c code.

I think I suggested to make it a header first because there were still
parts that were report_{hw,sw}_tags.c specific, and the helper
function would be used by those 2 to build their version of
kasan_get_bug_type(), but that doesn't seem to be the case anymore.

> > +const char *kasan_get_bug_type(struct kasan_access_info *info)
> If this function has to be in the header, it should be declared as
> static inline.
> But I don't think it has to be there in the first place.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
