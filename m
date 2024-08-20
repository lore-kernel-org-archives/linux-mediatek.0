Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F09C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Aug 2024 23:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOMk6nKdU/OadJM5Jw+DEbKFriLlwrQLkyoJvB74aPU=; b=LmrPVQqJ5EaVqzqDpcv3oHuSN1
	SSBdSUKDPx16meLjYOvToc9lOcd+2ySF69q9KOQNuBiGgCrj1nLn5cmjcm4Vl9dLqU7FiVUDn+a4i
	e9mLSBwc+si133wAGDOBRd21X6ljl/R/JFlMjIAXeTIY1QimoLHnMj6Uv25Cz3g6xVCRPgIJhxpO0
	FxYBagRH9He3ab/x6N+CFrDQJKgzogdYdtbykCcHnN6MDiy3w1KdWoRd1tZDs2XswlECWEMQgVTM4
	wiA30oBkfdMcmLycS1rMg+9FNsUOyIcp83sCajWBZjcVMQw8WfmNIVr4JRWTbo6NJ+SL/ge/dw2ZW
	wxoFQmjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgYYF-00000006ygh-07T7;
	Tue, 20 Aug 2024 23:46:11 +0000
Received: from out-189.mta1.migadu.com ([2001:41d0:203:375::bd])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgYXV-00000006yUt-11XI
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Aug 2024 23:45:27 +0000
Message-ID: <026dc2a7-7f43-43a3-b138-3a4fedf41a5f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1724197521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jOMk6nKdU/OadJM5Jw+DEbKFriLlwrQLkyoJvB74aPU=;
	b=X94LOzhvuUUoTZgkLED1+PiitTkGsST+HZTDpWuzpeOQsXTT6ZRaisAB7H3hrXL4qQoXWU
	DD8twRI/XnTQbiw2ooE5Fn/mO4A9pZwCxzsxqe+h4YHFHMsrI4SudfCt6PL+/1t6H6BEK1
	ltR4LozCn02uw5ZUxyOD+9Ug/Xdpe+Q=
Date: Tue, 20 Aug 2024 16:45:12 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v3] net/socket: Check cgroup_bpf_enabled() only once in
 do_sock_getsockopt()
To: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
Cc: Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 bobule.chang@mediatek.com, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Yanghui Li <yanghui.li@mediatek.com>,
 Cheng-Jui Wang <cheng-jui.wang@mediatek.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240820092942.16654-1-Tze-nan.Wu@mediatek.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
In-Reply-To: <20240820092942.16654-1-Tze-nan.Wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_164525_451039_0E953D14 
X-CRM114-Status: GOOD (  12.55  )
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

On 8/20/24 2:29 AM, Tze-nan Wu wrote:
> The return value from `cgroup_bpf_enabled(CGROUP_GETSOCKOPT)` can change
> between the invocations of `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN` and
> `BPF_CGROUP_RUN_PROG_GETSOCKOPT`.
> 
> If `cgroup_bpf_enabled(CGROUP_GETSOCKOPT)` changes from "false" to
> "true" between the invocations of `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN` and
> `BPF_CGROUP_RUN_PROG_GETSOCKOPT`, `BPF_CGROUP_RUN_PROG_GETSOCKOPT` will
> receive an -EFAULT from `__cgroup_bpf_run_filter_getsockopt(max_optlen=0)`
> due to `get_user()` was not reached in `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN`.
> 
> Scenario shown as below:
> 
>             `process A`                      `process B`
>             -----------                      ------------
>    BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN
>                                              enable CGROUP_GETSOCKOPT
>    BPF_CGROUP_RUN_PROG_GETSOCKOPT (-EFAULT)
> 
> To prevent this, invoke `cgroup_bpf_enabled()` only once and cache the
> result in a newly added local variable `enabled`.
> Both `BPF_CGROUP_*` macros in `do_sock_getsockopt` will then check their
> condition using the same `enabled` variable as the condition variable,
> instead of using the return values from `cgroup_bpf_enabled` called by
> themselves as the condition variable(which could yield different results).
> This ensures that either both `BPF_CGROUP_*` macros pass the condition
> or neither does.
> 
> Co-developed-by: Yanghui Li <yanghui.li@mediatek.com>
> Signed-off-by: Yanghui Li <yanghui.li@mediatek.com>
> Co-developed-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
> Signed-off-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
> Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>

Please tag bpf in the subject and add a Fixes tag.

[cc: Stanislav]

pw-bot: cr


