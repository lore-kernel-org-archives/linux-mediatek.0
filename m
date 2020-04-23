Return-Path: <SRS0=CwkH=6H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2628C54FD0
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 15:13:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8662220857
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 15:13:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T+0I+4gZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iw5Pumrk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8662220857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWC8Qp03DAYQIsDKiuB93FTbnTSYebBj3BaSizhXdnc=; b=T+0I+4gZqYGflf
	NGkbJnOcOHBNFeGiVGNm9typ37iLUfkpOKTjRNq0+vJIe3y0pwafcbtgbI01XdsZZxPdaCP6SpE4r
	tZK+61AqJrjbZ58e1U2ZnkmNSECjA65lZJKWNqPwpJW7NYh7XM1Y/DCNbe5nei23FyKDt2/IQ11Lf
	15WI9NzcEK7VoqSQaCpPBE6KW+NS6mqbV8b8zvIFSYihy6hR5Fwlonf6a6UHdOdrVzZF08hGOFV3r
	qLOSX6XYqZ1ZOoTeR1HHoq7KC3yoaSHhoell3b0n0pPE1jlHRz7CkCIYw4G7ENTAkLhZ6u2OGa0l+
	mevm57AXtCsCByF+ChwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRdXC-0006cO-0R; Thu, 23 Apr 2020 15:13:02 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRdX8-0006bG-M3
 for linux-mediatek@lists.infradead.org; Thu, 23 Apr 2020 15:13:00 +0000
Received: by mail-wm1-x344.google.com with SMTP id z6so6957613wml.2
 for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2020 08:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UTeQeyto1m9v5SuM5s4edMyeNen1x/MgttTL6x5XBaI=;
 b=iw5PumrkE5tqjlzCsaMqI20CHiXkIq28cZxQKuxfCha3jMxVbtGl6SD5je3Nz0E4bV
 cqmjnLcMA2tqqU8+zI3/jNhwckZtEBWsz/83I1YLcPij7OdReAARgFEvOCsQfvSg2Hue
 CV+ej96HusLzaqZEYHGcQItEgti4huE+fBPOnCnmhtMwrLqS6xDGdq2YwK6kpsPcAgPK
 9/kZwf+6oOTKdSytvqn7NUBtlDJQzxJbbRstoM5Rn9Td82mHmVtiPUaOf9mlba3BR9X9
 WqihTMlRXZYAEeGiEiTm/kkDgR2NEXT+s/pOJLW5xVi4Jy50tC67SaICig75NffChPdy
 GP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UTeQeyto1m9v5SuM5s4edMyeNen1x/MgttTL6x5XBaI=;
 b=I1HNQIibs7b9Zs90v1LKjZSZ3cWHFN29rmcmgHrpX6v0LhqwBRoz9Cf7KrcYiHQ6cN
 2vqETFQGkPQO6e4P4Q/J7NO0deliIkOASVJoPj+OiS6jJM/XP7irq4/MIKR6Li7VJkvC
 rcD8l9nnPmKhhAk0vfTavcC3vyH7XpRUxG4hGj5SVfv8ZPGFEMiWWJqFU21N9tuH7yQA
 lY8T56mpvXuW9ifQkjGMqrZxBQX6NeC3073nUpvTny5jXzQuRPsl2AHSdp4JzdXyoBjo
 TGZ7sglfXqYunEruvuCNOL7xYtiFqQVNtygELQzrRjpX4ftxHrXtuHW4K8uf6wwSkmps
 X7OA==
X-Gm-Message-State: AGi0PuZLgyrOX0Y2U6bqkwykhHYamgxGTu1Q4ovsDmGZeC9UKFnzvNaM
 FSRXCF2PGXz+RUPzUtfEx3sbcQ==
X-Google-Smtp-Source: APiQypJEQibO8s5dDdPKk1vNMfNrO+DNEUITlcbdqfwFUErA7buEWgNGHo8cuZ6SAl0DQrcK5ToIww==
X-Received: by 2002:a1c:1d84:: with SMTP id d126mr4597986wmd.119.1587654776840; 
 Thu, 23 Apr 2020 08:12:56 -0700 (PDT)
Received: from linaro.org ([37.167.216.250])
 by smtp.gmail.com with ESMTPSA id l16sm4161477wrp.91.2020.04.23.08.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 08:12:56 -0700 (PDT)
Date: Thu, 23 Apr 2020 17:12:50 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v6 04/10] PM / EM: add support for other devices than
 CPUs in Energy Model
Message-ID: <20200423151250.GB65632@linaro.org>
References: <20200410084210.24932-1-lukasz.luba@arm.com>
 <20200410084210.24932-5-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200410084210.24932-5-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200423_081259_245221_B70DE440 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, festevam@gmail.com, mka@chromium.org,
 robh@kernel.org, amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, agross@kernel.org,
 b.zolnierkie@samsung.com, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, linux-imx@nxp.com, rui.zhang@intel.com, mgorman@suse.de,
 orjan.eide@arm.com, daniel@ffwll.ch, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 10, 2020 at 09:42:04AM +0100, Lukasz Luba wrote:
> Add support for other devices that CPUs. The registration function
> does not require a valid cpumask pointer and is ready to handle new
> devices. Some of the internal structures has been reorganized in order to
> keep consistent view (like removing per_cpu pd pointers). To track usage
> of the Energy Model structures, they are protected with kref.

Why not add the energy model structure in the struct device directly?

For instance for the em_cpu_get() function, the cpu id allows to retrieve the
cpu device and then from there, the energy model instead of browsing another
list. The em_device life cycle will be tied to the struct device.

Then when the struct device and the em_device are connected, add the debugfs
with a struct device list for those which are energy aware, so you end up with
a structure:

struct em_device {
	struct device *dev;
	struct list_head em_dev_list;
};

(a global single dentry for debugfs to do a recursive delete is enough).

Locks when inspecting and add/removal called from the struct device release
function. So no need of an extra refcounting.

Does it make sense?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
