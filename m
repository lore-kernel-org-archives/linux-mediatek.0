Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82799C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Mar 2023 18:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFKYNp+Neuov7KhL6+FviygGAp7uK5yQBy9Jg2JEZ9Y=; b=DiapaOKYDF9jqv+KyGCo1ov/In
	qUC6T6EXAZ6y6K46yeAS2FoAvOdCgWDjUg6mThDoRRJH8NqpYopOwz2A6PTnZG03vMM79U7IWkRrK
	Y5EG7/zD/Ci66oxsR7L2XhWU2ppoDG1TjFl5G1lg8DFL13WasJmAovhwN3A0BNgC9mQ4Pn/B5Vcxl
	BycSzqhRhMOiZGGLtqgxFQ/n9oTxTPIH6I/iIjpuH1kL+aJzf0GAnavmzMcI4+j8wPetxgFOknO8p
	aFUHa+HIWkWiKU/YJ6CkFBTOYjjOCKVvL9lOsxh/yXVjzKCVhOvi4tRY272oEHpmuTAgTGufestxz
	eeHkRVPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdbP5-005ALF-1N;
	Sat, 18 Mar 2023 18:35:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdbP0-005AKW-11;
	Sat, 18 Mar 2023 18:35:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D2E7460EF6;
	Sat, 18 Mar 2023 18:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45902C4339C;
	Sat, 18 Mar 2023 18:35:35 +0000 (UTC)
Date: Sat, 18 Mar 2023 14:35:33 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "Tom Zanussi"
 <zanussi@kernel.org>, <Bobule.chang@mediatek.com>,
 <wsd_upstream@mediatek.com>, Tze-nan Wu <Tze-nan.Wu@mediatek.com>,
 <stable@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] tracing: Fix use-after-free and double-free on last_cmd
Message-ID: <20230318143533.1890d9bc@rorschach.local.home>
In-Reply-To: <20230317053044.13828-1-cheng-jui.wang@mediatek.com>
References: <20230317053044.13828-1-cheng-jui.wang@mediatek.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_113538_396089_47158422 
X-CRM114-Status: GOOD (  21.70  )
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

On Fri, 17 Mar 2023 13:30:44 +0800
Cheng-Jui Wang <cheng-jui.wang@mediatek.com> wrote:

> From: "Tze-nan Wu" <Tze-nan.Wu@mediatek.com>

Hi!

Thanks for the report and the patch. Some nits below.

Also change the subject to:

	tracing/synthetic: Fix races on freeing last_cmd

> ---
>  kernel/trace/trace_events_synth.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/trace/trace_events_synth.c b/kernel/trace/trace_events_synth.c
> index 46d0abb32d0f..ce438eccab2e 100644
> --- a/kernel/trace/trace_events_synth.c
> +++ b/kernel/trace/trace_events_synth.c
> @@ -42,16 +42,25 @@ enum { ERRORS };
>  #undef C
>  #define C(a, b)		b
>  
> +static DEFINE_MUTEX(lastcmd_mutex);
> +
>  static const char *err_text[] = { ERRORS };
>  
>  static char *last_cmd;

Please keep the mutex and the variable it protects next to each other:

static DEFINE_MUTEX(lastcmd_mutex);
static char *last_cmd;

>  
>  static int errpos(const char *str)
>  {
> -	if (!str || !last_cmd)
> -		return 0;
> +	int ret = 0;
> +
> +	mutex_lock(&lastcmd_mutex);
> +	if (!str || !last_cmd) {

Change this to just:

	if (!str || !last_cmd)
		goto out;

> +		mutex_unlock(&lastcmd_mutex);
> +		return ret;

> +	}
>  
> -	return err_pos(last_cmd, str);
> +	ret = err_pos(last_cmd, str);

Add:

 out:

> +	mutex_unlock(&lastcmd_mutex);
> +	return ret;
>  }
>  
>  static void last_cmd_set(const char *str)
> @@ -59,18 +68,24 @@ static void last_cmd_set(const char *str)
>  	if (!str)
>  		return;
>  
> +	mutex_lock(&lastcmd_mutex);
>  	kfree(last_cmd);
>  

In this case, you can remove the space:

	mutex_lock(&lastcmd_mutex);
	kfree(last_cmd);
	last_cmd = kstrdup(str, GFP_KERNEL);
	mutex_unlock(&lastcmd_mutex);

>  	last_cmd = kstrdup(str, GFP_KERNEL);
> +	mutex_unlock(&lastcmd_mutex);
>  }
>  
>  static void synth_err(u8 err_type, u16 err_pos)
>  {
> -	if (!last_cmd)
> +	mutex_lock(&lastcmd_mutex);
> +	if (!last_cmd) {

This should be:

	if (!last_cmd)
		goto out;

> +		mutex_unlock(&lastcmd_mutex);
>  		return;
> +	}
>  
>  	tracing_log_err(NULL, "synthetic_events", last_cmd, err_text,
>  			err_type, err_pos);

 out:

> +	mutex_unlock(&lastcmd_mutex);
>  }
>  
>  static int create_synth_event(const char *raw_command);

Thanks,

-- Steve

