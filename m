Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E267AC6FD19
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 09:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxe94wucfwiIxdubvu53KSQWuqpnJ5N5K+N2JaQRnG0=; b=qOXSt5RWuPqQp2x1bxGAxKZffg
	2Ub1s0hD+ZThsnvoFMTkSkQ4hJNjIQvPCHG1lT+SxgKf8TQ6/igD9bCyABJMfW/huoFH9bqYlejUM
	Gs20G2Zv0O0AMXw//4PB+uVs7xFQ9Xi+Fah8xLyYYagBaDXXpGd6te1/MY3r/gzvzEfhf4ZUelH2+
	bbE1Wcie3hJjWikydh6/LZKPhIS74tojZEadu6WJCueFP0UFnAgV4ns8OdKg/fHylNdBTxDAkvTOk
	joCv/kbU718WwjrukZ38PQqiOU6lA1rwF5TvMs5dz6K/wWpcGLGhNmS9ZLI0dtYvENFihMz+UsQh1
	mDAvmE8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYnA-00DqNP-8f; Fri, 10 Mar 2023 09:12:00 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYmy-00DqKF-1U; Fri, 10 Mar 2023 09:11:49 +0000
Received: by mail-wm1-x331.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso2963984wmo.0;
        Fri, 10 Mar 2023 01:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678439506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hxe94wucfwiIxdubvu53KSQWuqpnJ5N5K+N2JaQRnG0=;
        b=RNvrlQHWfGAAswhueOK43XkddWxDdcbn00PkJKQ3R14urHwbOmO48UbDEZ4stUyKLS
         J3JlbjMDGo8VjOroxddALvzjqMwEuI0+3wS5hnv96sYq0Br9sXLRhunWOUoGyPSDwAND
         lvJ5D6V5EcQW7MoSqZYOjYKSAyhJgWyhfWQ3qMJg5QU/GJdNq/gKeXw2jemJrST44Si0
         3tUucouwjA78IcpqH1yeA4a3L2gx198y59/tA4g/xaXU1BYuoo1M5ImN9hdDFTRh2lYz
         v+cV1a8zwAmuCzHGYP45BbhfqxYpggH/8pnSrtzAss+mMo/wPDEWd8zs/AsaMhLIhFGm
         xIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678439506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxe94wucfwiIxdubvu53KSQWuqpnJ5N5K+N2JaQRnG0=;
        b=mLlHUHxUe1CD69C4I8A0QYowM0twuFO1FkGd7ju83l+0vKqz0JfFXOh2ybH+HIjjpo
         MA7VTb0iigesHNQCanmJRpN4hmY59xkbCiBOMNB3hPVcJc9XF0MLmpdkMWBKDXxjU5+D
         XcvuNTrLz2prY+reeElTprp6+1VgZVFZXct/4mCtRyIYyWW67zx0tsBoP+fXRcY04g0k
         clzB3NuzMcUwpb0GyAh83M7qY0umx7CDl0HtQgbcIO5XZHMQYIZBojUXXe0DfcgXLw6e
         k4KyzbkK2pC1xA99u4AQqhU/39Ajze5u0V6EC8C8tOg790m2pwzothVE3ZukRMHrrPkL
         bI8w==
X-Gm-Message-State: AO0yUKUZAKi71T6Jk4Hv3i/tQbkN7gl+I+wPSvPxJJwbTfX0X8Wv+SLC
	J0JkZwufU7vtmsO9Q7U0Beg=
X-Google-Smtp-Source: AK7set90kAs3T7CZZ23UNLeDlH1k1Nx56UCt9ooh3U48+i31Rb60ANX98xJlVoeqdCsflxCCipslQg==
X-Received: by 2002:a05:600c:468b:b0:3ea:e667:b1ee with SMTP id p11-20020a05600c468b00b003eae667b1eemr2045911wmo.38.1678439506199;
        Fri, 10 Mar 2023 01:11:46 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i21-20020a05600c355500b003e214803343sm2476787wmq.46.2023.03.10.01.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 01:11:45 -0800 (PST)
Date: Fri, 10 Mar 2023 12:11:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: "jia-wei.chang" <jia-wei.chang@mediatek.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	hsinyi@google.com, Nick <vincent@systemli.org>
Subject: Re: [PATCH v1 2/3] cpufreq: mediatek: fix KP caused by handler usage
 after regulator_put/clk_put
Message-ID: <67024b47-f3c9-4764-9883-d52602cfefca@kili.mountain>
References: <20230310051750.4745-1-jia-wei.chang@mediatek.com>
 <20230310051750.4745-3-jia-wei.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310051750.4745-3-jia-wei.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_011148_109249_41CE7A83 
X-CRM114-Status: GOOD (  15.95  )
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

On Fri, Mar 10, 2023 at 01:17:49PM +0800, jia-wei.chang wrote:
> From: "Jia-Wei Chang" <jia-wei.chang@mediatek.com>
> 
> Any kind of failure in mtk_cpu_dvfs_info_init() will lead to calling
> regulator_put() or clk_put() and the KP will occur since the regulator/clk
> handlers are used after released in mtk_cpu_dvfs_info_release().
> 

This patch is harmless but it's not required.

If the mtk_cpu_dvfs_info_init() function is not able to complete
successfully then it cleans up all the partial allocations.  If it is
able to allocate everything successfully, then the caller, which is
mtk_cpufreq_probe(), adds it to the &dvfs_info_list.  If the
probe() function is not able to complete successfully it releases
everything in the &dvfs_info_list.

In this way, mtk_cpu_dvfs_info_init() never frees anything which has
not been allocated and it never frees anything which has already been
freed.  All the IS_ERR() checks in mtk_cpu_dvfs_info_release() can be
removed.

In reviewing this code, I can't help but notice that mtk_cpu_dvfs_info_init()
is buggy.  Please read my blog on error handling:
https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

drivers/cpufreq/mediatek-cpufreq.c
   411          info->cpu_clk = clk_get(cpu_dev, "cpu");
   412          if (IS_ERR(info->cpu_clk)) {
   413                  ret = PTR_ERR(info->cpu_clk);
   414                  return dev_err_probe(cpu_dev, ret,
                        ^^^^^^^^^^^^^^^^^^^^
Here we have a direct return which means there is nothing to free.
Okay.

   415                                       "cpu%d: failed to get cpu clk\n", cpu);
   416          }
   417  
   418          info->inter_clk = clk_get(cpu_dev, "intermediate");
   419          if (IS_ERR(info->inter_clk)) {
   420                  ret = PTR_ERR(info->inter_clk);
   421                  dev_err_probe(cpu_dev, ret,
   422                                "cpu%d: failed to get intermediate clk\n", cpu);
   423                  goto out_free_resources;
                        ^^^^^^^^^^^^^^^^^^^^^^^
The last thing we successfully allocated was ->cpu_clk so ideally the
goto would be something like "goto put_cpu_clk;".  Let's assume this
clk_get() fails.


   424          }
   425  
   426          info->proc_reg = regulator_get_optional(cpu_dev, "proc");
                ^^^^^^^^^^^^^^
Note that this is where ->proc_reg is allocated.  Prior to that point
it is NULL because it's allocated with kzalloc().

   427          if (IS_ERR(info->proc_reg)) {
   428                  ret = PTR_ERR(info->proc_reg);
   429                  dev_err_probe(cpu_dev, ret,
   430                                "cpu%d: failed to get proc regulator\n", cpu);
   431                  goto out_free_resources;
   432          }

[ snip ]

   536  out_free_resources:
   537          if (regulator_is_enabled(info->proc_reg))
                                         ^^^^^^^^^^^^^^
Oops!  This is a NULL dereference because ->proc_reg wasn't allocated
yet.

   538                  regulator_disable(info->proc_reg);
   539          if (info->sram_reg && regulator_is_enabled(info->sram_reg))
   540                  regulator_disable(info->sram_reg);
   541  
   542          if (!IS_ERR(info->proc_reg))
   543                  regulator_put(info->proc_reg);
   544          if (!IS_ERR(info->sram_reg))
   545                  regulator_put(info->sram_reg);
   546          if (!IS_ERR(info->cpu_clk))
   547                  clk_put(info->cpu_clk);
   548          if (!IS_ERR(info->inter_clk))
   549                  clk_put(info->inter_clk);
   550  
   551          return ret;
   552  }

It would be safer and more readable to have:

err_put_inter_clk:
	clk_put(info->inter_clk);
err_put_cpu_clk:
	clk_put(info->cpu_clk);

etc.

regards,
dan carpenter


