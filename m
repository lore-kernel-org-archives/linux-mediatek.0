From: Kristian Evensen <kristian.evensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Problems enabling the PCIe/USB3.0 port on MT7623N
Date: Fri, 3 Nov 2017 13:26:28 +0100
Message-ID: <CAKfDRXgYpz0akLt8x=P1Br7v5sWmxxy=N+d-5VAaL88McCSpWQ@mail.gmail.com>
References: <CAKfDRXjNJSJZe_QjuE8H+_ZXVWo1NKM7vrqHBhJ-tAMXqsyxwg@mail.gmail.com>
 <1509675191.20200.18.camel@mtkswgap22>
 <CAKfDRXjrDPKo-mveCb8o7YFdBbBa53kt8WTPDi1RhMXMcbvMYw@mail.gmail.com>
 <d9c34106-3a90-1df0-6765-1ab230372468@phrozen.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <d9c34106-3a90-1df0-6765-1ab230372468-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Cc: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi John,

On Fri, Nov 3, 2017 at 1:19 PM, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org> wrote:
> the patch in LEDE is an old version of the driver, feel free to send a patch
> backporting latest from upstream.
> I managed to get the 2nd USBport working on the LEDE last night and will
> push a patch today. the usb2 node is simply not getting enabled and the 2nd
> phys node is missing 2 properties.

Thanks for letting me know! Would it be possible to send me the patch
or share the changes to the dts/dtsi, so that I can test on my board?

 I will give backporting a go. Worst case it will be good exercise and
an introduction to getting more familiar with the archiecture :)

-Kristian
