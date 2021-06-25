Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C48C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 14:17:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E57666109D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 14:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E57666109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xQWsCB4ymNNO6MW1uLOaaySH+WwUPxjqA6+z+Mh+nMM=; b=3r7wGQ644U6bse
	2aTogBU9VHr738u9F4rsVdoLDY4ejqMat9l7ub0P+ew1cLh7u3Du9cjwmdUr12lYk6yB7S8w4zLKp
	LZCFjMDjXcSK9tFor8WD1L+txb9fIYqs9qr76NCyoOotPQfBSsnS2bp0lSGhvDVkKpBXPL2mpLv8l
	BAV1VoJDkj6ysPA/VH8iehNh1aI0RW6nfBvZAni/YjBxFfcNh8F7NMwaUMzX0QHMck/XVFnGUEMyh
	2kjLwsHNmH1sBNDLvN2AX9NO8M0hh09MMnzgFURkQ3UnaMZFT5HycZaZlGaR7/Db8C4Flyfq8suD+
	IE6tKxttqRIMkpGpnVqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwmdc-001saR-9w; Fri, 25 Jun 2021 14:16:56 +0000
Received: from mail-oo1-f48.google.com ([209.85.161.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwmai-001qgu-0h; Fri, 25 Jun 2021 14:14:00 +0000
Received: by mail-oo1-f48.google.com with SMTP id
 s10-20020a4aeaca0000b029024c2acf6eecso1305189ooh.9; 
 Fri, 25 Jun 2021 07:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eb2oox1oUIO8Ak6tDnGLYRSFQXaa3Y9McJsZ/3tyhSA=;
 b=Hdxv6DAygKSCxb/xwhZ5dX612vfTUGVy1RhQ0aVmr2oQ4Bo8xWlzr0iccetjNrT1Lw
 J2M4aUl0xPWBeSyr4rMT+K1KCZXXYkoi5zwPbaM8J84oTLO5aEj3ut0ogJNtojOWRaZD
 DKMGakrQ6yCqbwRie2vRD3tb1B/uImzX85eW3XQw0ggzxcBvBmkrVyLEOziU8bHF0vuQ
 z8lsVtQN3wrpe39dZnaZ0a+N3a+PuTPFozr2GBQp1UELIHh/lUMw5KQKHhDF64+6w9dH
 heLbNecvRgLm03NE6XFdikVGjpoGtXE57ZJ3MCQ/FWmzAlkzK2JnBIDflm7pjDd56b8P
 ikvA==
X-Gm-Message-State: AOAM533rdT0fiUNZ1HIdus1xUX7lAymGhbLJ+cIdNudN86BlM7xZdIn0
 acTKH2JbQ7z8OrKkBPZfHppvRIN0AsLtj3ubz3s=
X-Google-Smtp-Source: ABdhPJw8M9hdAhNOk4vX0DAD2iZIO6vcnGIazvppe7fETJt+EqtFocDXvQ0NnG7QX7KzoyLNjT2n3Qd0MJYwqB/iyoo=
X-Received: by 2002:a4a:5285:: with SMTP id d127mr9265501oob.2.1624630432823; 
 Fri, 25 Jun 2021 07:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210625134129.11885-1-tung-chen.shih@mediatek.com>
In-Reply-To: <20210625134129.11885-1-tung-chen.shih@mediatek.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 25 Jun 2021 16:13:41 +0200
Message-ID: <CAJZ5v0hdbML+J5yYQpoEeQJhO_QriDmmRuUhcsWDBxK1t4sknA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] cpufreq: fix the target freq not in the range of
 policy->min & max
To: TungChen Shih <tung-chen.shih@mediatek.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, 
 Linux PM <linux-pm@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_071356_113923_5796FC74 
X-CRM114-Status: GOOD (  24.94  )
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

On Fri, Jun 25, 2021 at 3:41 PM TungChen Shih
<tung-chen.shih@mediatek.com> wrote:
>
>     In cpufreq_frequency_table_target(), this function will try to find
> an index for @target_freq in freq_table, and the frequency of selected
> index should be in the range [policy->min, policy->max], which means:
>
>     policy->min <= policy->freq_table[idx].frequency <= policy->max
>
>     Though "clamp_val(target_freq, policy->min, policy->max);" would
> have been called to check this condition, when policy->max or min is
> not exactly one of the frequency in the frequency table,
> policy->freq_table[idx].frequency may still go out of the range
>
>     For example, if our sorted freq_table is [3000, 2000, 1000], and
> suppose we have:
>
>     @target_freq = 2500
>     @policy->min = 2000
>     @policy->max = 2200
>     @relation = CPUFREQ_RELATION_L
>
> 1. After clamp_val(target_freq, policy->min, policy->max); @target_freq
> becomes 2200
> 2. Since we use CPUFREQ_REALTION_L, final selected freq will be 3000 which
> beyonds policy->max

As you accurately observed, the policy limits affect the target, not
the frequency that will be used, and "RELATION_L" means "the closest
frequency equal to or above the target".

You are not fixing a bug here IMO, you're changing the documented behavior.

> Signed-off-by: TungChen Shih <tung-chen.shih@mediatek.com>
> ---
>  include/linux/cpufreq.h | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index 353969c7acd3..60cb15740fdf 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -975,21 +975,40 @@ static inline int cpufreq_frequency_table_target(struct cpufreq_policy *policy,
>                                                  unsigned int target_freq,
>                                                  unsigned int relation)
>  {
> +       int idx = 0;
>         if (unlikely(policy->freq_table_sorted == CPUFREQ_TABLE_UNSORTED))
>                 return cpufreq_table_index_unsorted(policy, target_freq,
>                                                     relation);
>
>         switch (relation) {
>         case CPUFREQ_RELATION_L:
> -               return cpufreq_table_find_index_l(policy, target_freq);
> +               idx = cpufreq_table_find_index_l(policy, target_freq);
> +               break;
>         case CPUFREQ_RELATION_H:
> -               return cpufreq_table_find_index_h(policy, target_freq);
> +               idx = cpufreq_table_find_index_h(policy, target_freq);
> +               break;
>         case CPUFREQ_RELATION_C:
> -               return cpufreq_table_find_index_c(policy, target_freq);
> +               idx = cpufreq_table_find_index_c(policy, target_freq);
> +               break;
>         default:
>                 WARN_ON_ONCE(1);
>                 return 0;
>         }
> +
> +       /* target index verification */
> +       if (policy->freq_table[idx].frequency > policy->max) {
> +               if (policy->freq_table_sorted == CPUFREQ_TABLE_SORTED_ASCENDING)
> +                       idx--;
> +               else
> +                       idx++;
> +       } else if (policy->freq_table[idx].frequency < policy->min) {
> +               if (policy->freq_table_sorted == CPUFREQ_TABLE_SORTED_ASCENDING)
> +                       idx++;
> +               else
> +                       idx--;
> +       }
> +
> +       return idx;
>  }
>
>  static inline int cpufreq_table_count_valid_entries(const struct cpufreq_policy *policy)
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
