Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1884C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 08:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/7EE05bf2EiL0OA8ookLpa77SFpm8Ou205zaFc0i9u8=; b=PWKW+VTWAfbwL4
	ern9YB37msJzC5JsMFCJNufb3+3bt6m4DFsJ4kEzAan5+zaP7voThoF8CE9J7ffiTCX1We6MFw/sz
	G+Hybm2+uuV0scP+DUHU7XoFzBQacDZy0jDdw4zDpaPG8YPV/wd6byoi7M9CJOgcqK+0m58zRhwAG
	v7u3LxwqCos6oLq17DWKYuEu5WXLPCGHAN6ZsPz6A2tDxBbhCL4ZIqnT31UhcP+CaZAoEelGk80xM
	eeVrt9Z4v364a2LjbhYGm83YsSKlVukA3crzRakJ2xUn8QiSbiRIS6GBPPuKJi+7dl9w5a8QJqHHC
	lc04u9Isl44oSjcAuIkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIRZd-006EOf-65; Fri, 11 Feb 2022 08:46:37 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIRZN-006ELZ-LS; Fri, 11 Feb 2022 08:46:27 +0000
Received: by mail-vs1-xe30.google.com with SMTP id v6so9386501vsp.11;
 Fri, 11 Feb 2022 00:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EEi9rjZri+XFBAgqsZ4Dh190lYm+ILIASE0FNRwP8Bc=;
 b=cFM3Bo93sb4bZ5QWlYpqdSzufSzk0QZyX40jtGtPY8m7paLI35o0hPq9I1jrJy0Wdp
 iwXU11s96NYMpWRFcxaZOpOc+ZxQ0mzu47f0b9h6rHqrhxNgFoDfstTf8sqqeu1u66Fo
 hYpFaktZhhi3XifvracAqeotZx87nLuOeEzW79zXtHRbZl9EUYxvE6WVMd4TWE6WaWlV
 +xcCNM8T1OQpCU7utzg9IvVpiuY83nqcXawNIA1+DZyYfc0lWevHHsLNlS0dVOoJAhHs
 wlc7F7lpbGHwP79ZlDlcKPAdQmEkxuVkp8Pve0DOVvEm9ffy6dNgXz2aAMl6kQSFHdzE
 2LUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EEi9rjZri+XFBAgqsZ4Dh190lYm+ILIASE0FNRwP8Bc=;
 b=vYRiYMN9yL+Iu1aWbozfik5GCVxFF2WbXR0kP3SS2haY7dwhlxj9BIGPoTIFIBAWwN
 dmlA+PSu7UFxn2W9f6Y2lGfBzXKSk29vA6PX5fEULz1P0JrBYoq36efiB69RiJLH11Am
 q4L25+SvZyHrUxSGIPfNdt02CgV+xe2qCuIAGFyEMfv50/NK2YGgxCUnidbTOkYkVMOn
 894cWXuehaONLRoo+5uIA1p3HircGoR7piq9hBxVV+ON6kS/ASL4QWCvgh4JCShqtXA+
 Y/WOYo702XPZ2ALgYZQ8iMiCuw9QrJcOkS9XHZyo2VmhO61IVH0fG27QKpVo+YxC1i1a
 zTow==
X-Gm-Message-State: AOAM5322b4mcCF4JkayxpG4BlSoUpLnMEnLpMuJXa+2uQo6WQYU0HOdW
 DhZ4R1lRUPHe2iFQNS+CHzVel3d388YOA0nuKw==
X-Google-Smtp-Source: ABdhPJwS3UPkWHoBkGQeoYjm2Fjxk5btkaW/VYsdRqv4tooP2EqAOa4W8SISuMt7dDyz+x3iDwqnPL/QwZ0/R/eV61I=
X-Received: by 2002:a05:6102:1611:: with SMTP id
 cu17mr212809vsb.28.1644569179482; 
 Fri, 11 Feb 2022 00:46:19 -0800 (PST)
MIME-Version: 1.0
References: <20220211001345.3429572-1-gch981213@gmail.com>
In-Reply-To: <20220211001345.3429572-1-gch981213@gmail.com>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Fri, 11 Feb 2022 08:46:08 +0000
Message-ID: <CALjTZva7fKOzG7u4QYhZ+3ZGN2p5DV+fLh6WbFLFtSSfjKQ-ug@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ralink: mt7621: do memory detection on KSEG1
To: Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mips@vger.kernel.org, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_004621_741711_8202E87D 
X-CRM114-Status: GOOD (  14.74  )
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

Hi, Guo,

On Fri, 11 Feb 2022 at 00:14, Chuanhong Guo <gch981213@gmail.com> wrote:
>
> It's reported that current memory detection code occasionally detects
> larger memory under some bootloaders.
> Current memory detection code tests whether address space wraps around
> on KSEG0, which is unreliable because it's cached.
>
> Rewrite memory size detection to perform the same test on KSEG1 instead.
> While at it, this patch also does the following two things:
> 1. use a fixed pattern instead of a random function pointer as the magic
>    value.
> 2. add an additional memory write and a second comparison as part of the
>    test to prevent possible smaller memory detection result due to
>    leftover values in memory.

[patch snipped]

No issues here, and it does seem to have fixed the RAM size detection
on my Redmi AC2100. It's always been a very sporadic failure here, so
I'll be keeping an eye on it to see if there are any further
misdetections. :)
In any case, feel free to add my

Tested-by: Rui Salvaterra <rsalvaterra@gmail.com>

Thanks,
Rui

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
