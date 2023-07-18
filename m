Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84C2EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdlBUHWUDeKcYw0WXmCHBGLh8IA7flKlmSo8k4y0V60=; b=jDElH8yE5/+JbtdiOboqMetiuU
	BhRheLhJ4hJKkLKlyCe6PS7foo3Ve4y5pTg7nCP1Wik5zbQ3C1XMEWOrXlFTv808YON4xqlRUAuC7
	uidNfSbVtCMFIN2ZDnDQC+YEuTqpqY9YHf7Il3S9fJ/tcEQq+8vmpnQf23Rn1Mn6BnnGiIJLVCHFM
	zziUcDfelk079TVprXXDDPI1UZUkGYrMAnwRzjwZBsvUW6r7lqXyPGLWbUzA4Y5ibh/Ct3PutkEIU
	oNvnLK6CqQVdsChsUHdB5pQlGXCSZL4XCN9ZRDkvTGBTkcQZu7amDhg1zCycdLTTHG4Bz3X6/3xUV
	/nEQ8wUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzrz-005M0M-2J;
	Wed, 19 Jul 2023 05:37:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzry-005Lzh-2O
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:37:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tdlBUHWUDeKcYw0WXmCHBGLh8IA7flKlmSo8k4y0V60=; b=qSfzccuzCi9H/ZDUnapggv1SG9
	H24ntT0rzIaBi0SqTn5lXY8tOmFgIcllC0ceFgCdzLkX+y+sqUIfHXVZHmv5AsE03VP9A7Z3xF+Yi
	lAW8Hqg9zELBmUa9dfMm2DBhx5IWELGQ5MCwkC9ZbwKnmIUeNnL/KjWDOklBfGToig3EXThA7s+SO
	9yb5o8JdIbM5kJmJ4zhg+ray7vy1HFyTPW0ZkFL9UrYdsZGkykZX7E+UbU4k2WZgx6VhIWT5kIela
	k7SaBnw5blHdt9xOW0Byv5OB8TlTDSSqD52kOUpMB0Lw+FSV33ZZq4TnGAY2+whaNr5GmwFApvMRD
	yAJxBPKQ==;
Received: from smtp-27.smtpout.orange.fr ([80.12.242.27] helo=smtp.smtpout.orange.fr)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLpj8-00BsxF-2b
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Jul 2023 18:47:17 +0000
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id LpbhqgTmDgEYrLpbhqs7UZ; Tue, 18 Jul 2023 20:39:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1689705582;
	bh=tdlBUHWUDeKcYw0WXmCHBGLh8IA7flKlmSo8k4y0V60=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZQcVTd5KpaeF4EOE+fysig0lBxjfUmgJO3PowpFkNTGclDydzH+tYki8gEi+Imi5u
	 GkIbpmer1NKaH9M0eWIT1ZN2NADE/n9oQfzomnZbCavOjN5nNUqy0UpIEHc5n8Q1vg
	 5fq4ctk6/ZQ2JbRENF82CDW+oSr+cPd+noFMKqSeCxM7jysC5pbssV5dXpesa3A5pi
	 2ILIlsUoiO61Bq59piNwXMNArZnQ/2s6sz4a4qynqKcYOe9d5BycztLKblt7MlhLcs
	 VN1maZ3TcEOlXqOEKaF6s1+J/Qm86/IMmb0MrsGAuuFsuVxP6EamKutSk9sms1MJXR
	 iAPTcIILmSPGg==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 18 Jul 2023 20:39:42 +0200
X-ME-IP: 86.243.2.178
Message-ID: <60305a76-4e41-8e51-a394-dc55c0ba05da@wanadoo.fr>
Date: Tue, 18 Jul 2023 20:39:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: mediatek: vcodec: Fix an error handling path in
 vdec_msg_queue_init()
Content-Language: fr, en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <efa0d4910998931a2ec9d933117fa71482d7b33a.1689624542.git.christophe.jaillet@wanadoo.fr>
 <1dcd0fab-eee3-4693-a7d2-4a72baef5c97@kadam.mountain>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <1dcd0fab-eee3-4693-a7d2-4a72baef5c97@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_194715_135416_B4274A5B 
X-CRM114-Status: GOOD (  10.38  )
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

Le 18/07/2023 à 08:58, Dan Carpenter a écrit :
> On Mon, Jul 17, 2023 at 10:09:19PM +0200, Christophe JAILLET wrote:
>> All errors go to the error handling path, except this one. Be consistent
>> and also branch to it.
>>
>> Fixes: 2f5d0aef37c6 ("media: mediatek: vcodec: support stateless AV1 decoder")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
> 
> I sent this one a month ago but it hasn't been applied.
> 
> https://lore.kernel.org/all/b8948d9a-65bc-4f3f-aa90-60addd064819@moroto.mountain/
> 
> regards,
> dan carpenter
> 
> 

Hi Dan,

your patch is better than mine.
Less verbose and more complete.

CJ

