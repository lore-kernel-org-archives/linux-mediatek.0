From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 1/1] tracing: Fix event_trace_printk loss on printk_format.
Date: Wed, 13 Feb 2019 08:45:11 -0500
Message-ID: <20190213084511.45b86e15@gandalf.local.home>
References: <1549971717-4693-1-git-send-email-mars.cheng@mediatek.com>
 <20190212204113.5ecaa2a1@gandalf.local.home>
 <1550033650.7648.2.camel@mtkswgap22>
 <1550040585.12645.9.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550040585.12645.9.camel@mtkswgap22>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mars Cheng <mars.cheng@mediatek.com>
Cc: Andress Kuo <andress.kuo@mediatek.com>, CC Hwang <cc.hwang@mediatek.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, 13 Feb 2019 14:49:45 +0800
Mars Cheng <mars.cheng@mediatek.com> wrote:


> After some grep, I found event_trace_printk() not used in 5.0-rc*. But
> trace_printk() is still used in several places.

event_trace_printk() is an abomination, but trace_printk() is an
extremely useful tool. Don't touch that!

-- Steve
