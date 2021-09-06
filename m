Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59ADC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 09:43:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 891EF6069E
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 09:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 891EF6069E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VjaJw+C3lW3MzGasR5ynUe7IgoJWGO1zggxp5Hyuq5o=; b=Ilal6YQCxcmpGi
	AeIVox4eLdyk4n+kwimht8gH0p4WSRW4N7Iyb/RkflSHaGl/uv3MxhOQ1DKY2SLhgFjhQ6kC84mBE
	KPopwf2IdZQ+gKkA8L1KZGIZ5zzqk+Pwfk5iEjKlR6JSr2E2hUfh2YKH8UftOt4U+av6Lyq04pWky
	w8x8q1Zoa6qhvZ/47DYIx7PbHbnBAzQ6v7DQpMQNcbf6WQ2CG4A0rhERR/Fx8xl0+5ZTAvnsf0C+N
	fY+jIpFnQu9SPknYQIQvjoNuFaJemu5iwSZkG13+H3XB00uJqRZpSMTS8DcscBOKdly8zKSqRxcp1
	Y8IXh9HCLQKTlAi9ErUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNB9s-000PBK-7b; Mon, 06 Sep 2021 09:43:20 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNB9p-000PAR-6a
 for linux-mediatek@lists.infradead.org; Mon, 06 Sep 2021 09:43:18 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 ot2-20020a17090b3b4200b0019127f8ed87so3446226pjb.1
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Sep 2021 02:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9/JoqdqiEGw1zuw7XMiYKWfm9jX2kazYBZmS7xdP1/k=;
 b=WYPYOXSVHBptRJ0q9Gd1rc5ipBPKlx481Ahac7qF5CeFDcDQ2zjxcKbJwCRrjFpQA4
 hURmftGEPPPZNGOKyhyCUZvuAxvoFu33cooDNL0sJtGNAE3U83er9Yo+w+FA+xCLTaHp
 zdDpeLZIpgkTEJxbeUl9iSRWd0rTUZP8FUqiSSAUUA6OzGshEmCXKPWrS5XlqffUrHk6
 c5SwHWXP7iWD/nwZCyJM4vHpLhvsDwp7lVeG+xUOpQK3PyQxl9nbvpbddhkSXThLbJ9t
 IugRlfJRpSlP7nSdjEded1/CYqOnSt88zcdqT80QJRhYS1Qx0S22hjgqwZZ3zpqZwsXG
 QHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9/JoqdqiEGw1zuw7XMiYKWfm9jX2kazYBZmS7xdP1/k=;
 b=ASoju8AjBweAaZc8qhRILl980kku3a7jrJbja9mdaE3jwIIyVvWjcVDzfzUlcS+YEH
 66IfEVmuM4h9xJnvf3m8LdgrCW6MlLbUtTL2XcHHWl5MEiBju8ZERCx4bpjRj9EaER8h
 bp7R3R5RWSOAsFE2HjsiW8P2Qn7K2q4TafD5TiyHrzP0KjMRKgrfIISTEgGGPzM9E8fq
 oPyu9edeEUvmaIXpFglrWCx6D5k7xMExzc08Q8dZlTRlcTgDZ7ydHoXncUc95hKJmGV+
 I75WDFK3iqRqECL0CaIabdecnTBzAxtFgEBJyE0fagZCL9l7p8bFVwfkv3C6tQFIGK6E
 norg==
X-Gm-Message-State: AOAM532r2RgQcdtlHh1hFNChMuX9RLcyc1mYqIVbAsJsLZVrjtRC+r5w
 9Gz/4dO37RGpcNAGEDts1SwyUQ==
X-Google-Smtp-Source: ABdhPJwNLy/dXfiYyQnEloJsYlqUGd8CyWCxWl/Kjp+bv4L5M2+jjwqp/8iOZhRvgKnezUoJoGhmkg==
X-Received: by 2002:a17:902:e34b:b0:134:66bd:f241 with SMTP id
 p11-20020a170902e34b00b0013466bdf241mr9959608plc.27.1630921394459; 
 Mon, 06 Sep 2021 02:43:14 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id nh21sm6955135pjb.34.2021.09.06.02.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 02:43:12 -0700 (PDT)
Date: Mon, 6 Sep 2021 15:13:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Cc: linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH v15 2/3] cpufreq: Add of_perf_domain_get_sharing_cpumask
Message-ID: <20210906094309.rcacbme27zpvdd4a@vireshk-i7>
References: <1630658364-6192-1-git-send-email-hector.yuan@mediatek.com>
 <1630658364-6192-3-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1630658364-6192-3-git-send-email-hector.yuan@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_024317_296526_3391B704 
X-CRM114-Status: GOOD (  15.27  )
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

On 03-09-21, 16:39, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> Add of_perf_domain_get_sharing_cpumask function to group cpu
> to specific performance domain.
> 
> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>  include/linux/cpufreq.h |   46 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)

To speed things up, I have applied this with following changes. Please
test my branch and see if something breaks:

https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/log/?h=cpufreq/arm/linux-next

-- 
viresh

-------------------------8<-------------------------
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 9eb1fa17a8a4..acd3ee5b8b0a 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -1006,37 +1006,49 @@ static inline int cpufreq_table_count_valid_entries(const struct cpufreq_policy
        return count;
 }

-static inline int of_perf_domain_get_sharing_cpumask(int pcpu, const char *list_name,
-                                                    const char *cell_name, struct cpumask *cpumask)
+static inline int parse_perf_domain(int cpu, const char *list_name,
+                                   const char *cell_name)
 {
        struct device_node *cpu_np;
        struct of_phandle_args args;
+       int ret;
+
+       cpu_np = of_cpu_device_node_get(cpu);
+       if (!cpu_np)
+               return -ENODEV;
+
+       ret = of_parse_phandle_with_args(cpu_np, list_name, cell_name, 0,
+                                        &args);
+       if (ret < 0)
+               return ret;
+
+       of_node_put(cpu_np);
+
+       return args.args[0];
+}
+
+static inline int of_perf_domain_get_sharing_cpumask(int pcpu, const char *list_name,
+                                                    const char *cell_name, struct cpumask *cpumask)
+{
        int target_idx;
        int cpu, ret;

-       cpu_np = of_cpu_device_node_get(pcpu);
-       of_parse_phandle_with_args(cpu_np, list_name,
-                                  cell_name, 0, &args);
-       of_node_put(cpu_np);
-       target_idx = args.args[0];
+       ret = parse_perf_domain(pcpu, list_name, cell_name);
+       if (ret < 0)
+               return ret;
+
+       target_idx = ret;
+       cpumask_set_cpu(pcpu, cpumask);

        for_each_possible_cpu(cpu) {
                if (cpu == pcpu)
                        continue;

-               cpu_np = of_cpu_device_node_get(cpu);
-               if (!cpu_np)
-                       continue;
-
-               ret = of_parse_phandle_with_args(cpu_np, list_name,
-                                                cell_name, 0,
-                                                &args);
-
-               of_node_put(cpu_np);
+               ret = parse_perf_domain(pcpu, list_name, cell_name);
                if (ret < 0)
                        continue;

-               if (target_idx == args.args[0])
+               if (target_idx == ret)
                        cpumask_set_cpu(cpu, cpumask);
        }


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
