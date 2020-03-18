Return-Path: <SRS0=5sS2=5D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29119C10DCE
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 19:11:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0204420754
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 19:11:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kCeEDdz3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="lkxzxSmP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0204420754
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7SZgHqDsqW5I6F/HkSCUkhrIcb6hsR3HAXvTcuUeQs8=; b=kCeEDdz3+zlKKP
	ILM4Aqnr4Y7P3z7qqDkAOQcBXYBa5Xlu+XFKbjwR/ZvZ0kPZCSkTj0q/4XRJgoO/j39jiDIRh/z0C
	XXQJkSGpuJ10mEzueLRg3YebJXZign4qUt8I3/20OxKL+SK6bGBA9Q1IyLyhY3ofF/JKsw0dobc5X
	AwA4y3iQlNMLRdnQWG3TWNBwTfMIIXLKh+KjRaI6OCkixSgT5II3XvSF5Y50zcT7KW9ALijVUo+5X
	xCS4/9S5AwFlm3woIQLUwp1LW3VNj99SLYAfT1J6OMzU8zCJ8eQmBR29F0gHPt9JG0psO3LSjjtD/
	qSRvGkfVkLAB67WpLhdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEe6K-0002XD-I9; Wed, 18 Mar 2020 19:11:36 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEe67-0002IT-O0
 for linux-mediatek@lists.infradead.org; Wed, 18 Mar 2020 19:11:26 +0000
Received: by mail-ot1-x341.google.com with SMTP id t28so24101300ott.5
 for <linux-mediatek@lists.infradead.org>; Wed, 18 Mar 2020 12:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YEcNvKoxRLNncmofEeVv4yeDWdrbk4dUuTY3/HM5SJg=;
 b=lkxzxSmPoiFVrjW+D44Nlzoy7Y9BTyZ6PQpCllGw154b100MP5WuWaOD8/idtKRdN1
 eW54dVH6b4J85Yh7iKi6bJJfbSelvRDFyXBx3wyvx0oFFus1AOlmctj2Z5JvbyIEHHUZ
 /Jr09tDhinfXqXBq2oebzgol6mVeYcC+UyXyTHDzlp5RJD7V8dU38+VbiMAZuPGG6YF9
 hvBVYwDFqmUd6ydHL8N8g88fq/GSAzaTFW8j6JuF/V3UyExsBxHJS4eMrACrNI4o5nLl
 sC+7J1xx3mn9ikCZuhxsvKAh6qOSY243TaGZYevQ1VsO2EVhb25BOP3Gwdm7RCayZFKz
 QIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YEcNvKoxRLNncmofEeVv4yeDWdrbk4dUuTY3/HM5SJg=;
 b=KUfsnCVOU+DLG+akG+mSBVRYQ0zdaV+J+npcdZYh6xoaK/1bb3wk7YTFhXvwaMa+Xf
 L4eHsBoqY6Q6gfziDswAoiLfJGbuu8pGi5xVzBXiFjL4MyP1Fg7NRNpkhf7jv3HqUftd
 gclSppwlE/CzkRa8QUtqmY5knaEaXGba3dk2h3fFfu/H6inyu5604x6MmYnjAw0j9qVZ
 izmFghX+Wgxfr48w7t6eJxOcxGxHL2vnFjiiZMnpkddvCrriYlzXzFkQgsE1UgilVgt/
 av81vGGqZ5YL+nOP2Q/c2QHlO61T+s1C/yvZdVg5lwVy3Eb8IrxX4sh7/HFMyPwyrsXl
 IzyA==
X-Gm-Message-State: ANhLgQ1JuOrrPC5kDNDdgmjMf0GCvA1C5ALClDhki8a06/AqsBnC0Wc6
 rSpVPus4PO0/OIf/UAXZOOTrgUP7tindb7ihHw1W2Q==
X-Google-Smtp-Source: ADFU+vuQqQyKYY3GzReouxvk6jJyqQUm+Irep1pzseE+uxctbZi52pzI8VMFuxyNWh599gkbGFQoVDq1JwgQY4XyDz8=
X-Received: by 2002:a9d:6186:: with SMTP id g6mr5088006otk.236.1584558679434; 
 Wed, 18 Mar 2020 12:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200317065452.236670-1-saravanak@google.com>
In-Reply-To: <20200317065452.236670-1-saravanak@google.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 18 Mar 2020 12:10:43 -0700
Message-ID: <CAGETcx-uZ3YJHCYqFm3so8-woTvL3SSDY2deNonthTetcE+mXQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] Fix device links functional breakage in 4.19.99
To: stable <stable@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_121123_808492_90EFD9D6 
X-CRM114-Status: GOOD (  17.26  )
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
Cc: Linux PM <linux-pm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Android Kernel Team <kernel-team@android.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Mar 16, 2020 at 11:54 PM Saravana Kannan <saravanak@google.com> wrote:
>
> As mentioned in an earlier email thread [1], 4.19.99 broke the ability
> to create stateful and stateless device links between the same set of
> devices when it pulled in a valid bug fix [2]. While the fix was valid,
> it removes a functionality that was present before the bug fix.
>
> This patch series attempts to fix that by pulling in more patches from
> upstream. I've just done compilation testing so far. But wanted to send
> out a v1 to see if this patch list was acceptable before I fixed up the
> commit text format to match what's needed for stable mailing list.
>
> Some of the patches are new functionality, but for a first pass, it was
> easier to pull these in than try and fix the conflicts. If these patches
> are okay to pull into stable, then all I need to do is fix the commit
> text.

I took a closer look at all the patches. Everyone of them is a bug fix
except Patch 4/6. But Patch 4/6 is a fairly minimal change and I think
it's easier/cleaner to just pick it up too instead of trying to
resolve merge conflicts in the stable branch.

1/6 - Fixes what appears to be a memory leak bug in upstream.
2/6 - Fixes error in initial state of the device link if it's created
under some circumstances.
3/6 - Fixes a ref count bug in upstream. Looks like it can lead to memory leaks?
4/6 - Adds a minor feature to kick off a probe attempt of a consumer
5/6 - Fixes the break in functionality that happened in 4.19.99
6/6 - Fixes bug in 5/6 (upstream bug)

Greg

Do these patches look okay for you to pull into 4.19 stable? If so,
please let me know if you need me to send v2 with commit fix up.

The only fix up needed is to these patches at this point is changing
"(cherry picked from commit ...)" with "[ Upstream commit ... ]". The
SHAs themselves are the correct SHAs from upstream.

Thanks,
Saravana

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
